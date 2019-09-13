# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=teleport
pkgver=4.0.8
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('x86_64' 'arm')
url="https://gravitational.com/teleport"
license=('Apache')
depends=('glibc')
install=teleport.install
source_x86_64=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-amd64-bin.tar.gz"
    "teleport.service"
    )
sha256sums_x86_64=(
    '77ae0e0fa7d8fa6c2c07c316d1dabec5a255a48364b4a73eeb90619b0980459e'
    '3e332207cfa984a531044d47fde379a9c242aa92e0fef7804a031dff865396dc'
    )
source_arm=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    "teleport.service"
    )
sha256sums_arm=(
    'bbf6bb825b90f8cd1b06e20e6116433a30c25ad911878359a839d14b832734da'
    '3e332207cfa984a531044d47fde379a9c242aa92e0fef7804a031dff865396dc'
    )
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/lib/systemd/system" "${pkgdir}/usr/bin"
    install -m644 -t "${pkgdir}/usr/lib/systemd/system/" teleport.service
    cd "${srcdir}/teleport"
    install -m755 -t "${pkgdir}/usr/bin/" teleport tctl tsh
    # no man pages, docs or web assets in release tarball
}

