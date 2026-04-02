# Maintainer: DeepChirp <DeepChirp@outlook.com>

pkgname=ubaa
_reponame=UBAA
pkgver=1.5.0
pkgrel=1
_javaversion=21
pkgdesc="Cross-platform Compose Multiplatform client for Beihang University campus services"
arch=('x86_64')
_author=BUAASubnet
url="https://github.com/${_author}/${_reponame}"
license=('unknown')
makedepends=("java-environment=${_javaversion}")
depends=("java-runtime>=${_javaversion}" "bash")
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")

sha256sums=('8d3a664c53e9f7144d31d0b05c111ec20d356c9cfb8acfd9744424a6aa30223a'
            '79ce57a57321f1844d3f43c1f779d14e6ce95c60d6eb5adbffd0df3703f400e9'
            '141c9209a1633326fcc143f22cd3a15bfbf4e5e3ce441faa081b9c248daf1568'
            '6f9e5fb5a184b2ca77382cc00c65fd0ca1e38cf71b72dd419aa88d4efdbf4eaa')

build() {
    cd "${srcdir}/${_reponame}-${pkgver}"

    export API_ENDPOINT="https://ubaa.mofrp.top:2021"
    ./gradlew :composeApp:packageReleaseUberJarForCurrentOS --no-daemon
}

package() {
    cd "${srcdir}/${_reponame}-${pkgver}"

    install -Dm644 composeApp/build/compose/jars/*-linux-*.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
