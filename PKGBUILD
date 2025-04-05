# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname='muon'
oldName='snowflake'
pkgver=1.0.4
pkgrel=2
pkgdesc='Graphical SFTP client and terminal emulator with helpful utilities.'
arch=('any')
url="https://github.com/subhra74/snowflake"
license=('GPL3')
depends=('java-runtime>=11' 'hicolor-icon-theme' 'bash')
makedepends=('java-environment>=11' 'maven')
replaces=('snowflake')
conflicts=('snowflake' 'muon-ssh')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/subhra74/snowflake/archive/v${pkgver}.tar.gz"
    "${pkgname}"
    "${pkgname}.desktop"
)
sha256sums=(
    '92b49024a21fb8369476cb77823851f710cc56eaec3fb219330afdac43fab36a'
    'b06918fdb24a35e8c3b5348780780dbd40f9665d86e2d84e165add5d753bafc0'
    '00c904959ff8ce0ed19f9f62fe4feaf5e82d80e9bebeae4b9b672e6d681686f4'
)

build() {
    cd ${oldName}-${pkgver}

    mvn clean install
}

package() {
    install -Dm644 "${oldName}-${pkgver}/target/${oldName}-${pkgver}-full.jar" "${pkgdir}/opt/${pkgname}/${pkgname}.jar"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 "${oldName}-${pkgver}/src/main/resources/snowflake-logo256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/Muon.png"
}
