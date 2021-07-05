pkgname=snowflake
pkgver=1.0.4
pkgrel=1
pkgdesc='Graphical SFTP client and terminal emulator with helpful utilities.'
arch=('any')
url="https://github.com/subhra74/snowflake"
license=('GPL3')
depends=('java-runtime>=11')
makedepends=('java-environment>=11' 'maven')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/subhra74/snowflake/archive/v${pkgver}.tar.gz"
    "${pkgname}"
    "${pkgname}.desktop"
)
sha256sums=(
    '92b49024a21fb8369476cb77823851f710cc56eaec3fb219330afdac43fab36a'
    'd688b2ac7cbc88a28d02a108ef82fe6a6dbf6ac66c9aa3745f6869408bfa2b3f'
    '832e38bbf4a7b451b2bf674b294a9bc8299a24a9d7d37b517c1f3fd71ba6f80e'
)

build() {
    cd ${pkgname}-${pkgver}

    mvn clean install
}

package() {
    install -Dm644 "${pkgname}-${pkgver}/target/${pkgname}-${pkgver}-full.jar" "${pkgdir}/opt/${pkgname}/${pkgname}.jar"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 "${pkgname}-${pkgver}/src/main/resources/snowflake-logo256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/snowflake.png"
}
