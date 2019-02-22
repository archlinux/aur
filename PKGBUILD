# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=teleport
pkgver=3.1.7
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
    '040d2bac51002a6490dda8f5e541da5cd7eef165bd35723b22b70f679b036d9a'
    '3e332207cfa984a531044d47fde379a9c242aa92e0fef7804a031dff865396dc'
    )
source_arm=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    "teleport.service"
    )
sha256sums_arm=(
    '40bdbcd42485e9cbe0e9377b77fe2465eb4b225e6fb900ec8c7c98fe5ea0ffd7'
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

