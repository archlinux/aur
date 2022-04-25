# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname='muon-ssh'
pkgver=2.2.0
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
    '1c8a0e632f689898d9965ff47ec7103f7b9743837b95f049c2009f9002f09d0c'
    '374479a35bd6cce746a8492107eac4c14fd257fb0e1aa79b5af4677e117c4e45'
    '2b0f73bb8c5fb950afe62270843642d65555c46082949e5636936507841396c1'
)

build() {
    cd ${pkgname}-${pkgver}

    mvn clean install
}

package() {
    install -Dm644 "${pkgname}-${pkgver}/muon-app/target/muonssh_2.1.0.jar" "${pkgdir}/opt/${pkgname}/${pkgname}.jar" #! Temporary fix (upstream problem), in the future, replace 2.1.0 with ${pkgver}
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 "${pkgname}-${pkgver}/muon-app/src/main/resources/muon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/Muon-SSH.png"
}
