# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname='muon-ssh'
pkgver=2.3.0
pkgrel=1
pkgdesc='Graphical SFTP client and terminal emulator (SSH) with helpful utilities.'
arch=('any')
url="https://github.com/devlinx9/muon-ssh"
license=('GPL3')
depends=('java-runtime>=11' 'hicolor-icon-theme' 'bash')
makedepends=('java-environment>=11' 'maven')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/devlinx9/muon-ssh/archive/v${pkgver}.tar.gz"
    "${pkgname}"
    "${pkgname}.desktop"
)
sha256sums=(
    '9f3b6be086e2d25b0c50b82238db94c201e633664cce487066804067cf2e44ab'
    '374479a35bd6cce746a8492107eac4c14fd257fb0e1aa79b5af4677e117c4e45'
    '290b17b7eedc7695c059190d6b967151b5d99d68146c498cc5420ff0a3ea659f'
)

build() {
    cd ${pkgname}-${pkgver}

    mvn clean install
}

package() {
    install -Dm644 "${pkgname}-${pkgver}/muon-app/target/muonssh_${pkgver}.jar" "${pkgdir}/opt/${pkgname}/${pkgname}.jar"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 "${pkgname}-${pkgver}/muon-app/src/main/resources/muon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/muon-ssh.png"
}
