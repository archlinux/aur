# Maintainer: Arrelin <quickbluder@gmail.com>
pkgname=cheating-daddy
pkgver=0.7.0
pkgrel=1
pkgdesc="Real-time AI assistant for video calls, interviews, and meetings using Gemini AI"
arch=('x86_64')
url="https://github.com/sohzm/cheating-daddy"
license=('GPL-3.0-or-later')
depends=('electron' 'nodejs')
makedepends=('npm' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('0c6fbe6a749f5915196e35924ee5ac6a49d4ebe40b229bafe57d5d1344b8b21e'
            'fd32245b72be6fdd87866ed3ae21720e80eed6d79cc5a8062d4252c777a2eadd'
            '31eb724ca119a8268409e2f5202ed145df0a2c36794bda551eef1ae47ebe3700')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    npm install --cache "${srcdir}/npm-cache"
    npm run package
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/usr/lib/${pkgname}"

    install -Dm644 "out/Cheating Daddy-linux-x64/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}/app.asar"

    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "src/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
