# Maintainer: Johannes Pfrang <johannespfrang+arch @ gmail.com>
# Co-Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=teleport
pkgver=2.0.4
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('x86_64')
url="https://gravitational.com/teleport"
license=('Apache')
install=teleport.install
source=("https://github.com/gravitational/teleport/releases/download/v${pkgver}/teleport-v${pkgver}-linux-amd64-bin.tar.gz"
        "teleport.service")
sha256sums=('aa27fb0b200038f859a80e3165ac236f3b03d36b7c8a6c8e46ddb8fdcd2a642a'
            '3e332207cfa984a531044d47fde379a9c242aa92e0fef7804a031dff865396dc')

package() {
    mkdir -p "${pkgdir}/usr/lib/systemd/system" "${pkgdir}/usr/bin"
    install -m644 -t "${pkgdir}/usr/lib/systemd/system/" teleport.service
    cd "${srcdir}/teleport"
    install -m755 -t "${pkgdir}/usr/bin/" teleport tctl tsh
    # no man pages, docs or web assets in release tarball
}
