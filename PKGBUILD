# Maintainer: Johannes Pfrang <johannespfrang+arch @ gmail.com>
# Co-Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=teleport
pkgver=2.2.4
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('x86_64')
url="https://gravitational.com/teleport"
license=('Apache')
depends=('glibc')
install=teleport.install
source=("https://github.com/gravitational/teleport/releases/download/v${pkgver}/teleport-v${pkgver}-linux-amd64-bin.tar.gz"
        "teleport.service")
sha256sums=('f4ae9873888a9c1ab0c6af2ad6a7d6c0999004fccca65f6fdb66d43fd63f7e94'
            '3e332207cfa984a531044d47fde379a9c242aa92e0fef7804a031dff865396dc')

package() {
    mkdir -p "${pkgdir}/usr/lib/systemd/system" "${pkgdir}/usr/bin"
    install -m644 -t "${pkgdir}/usr/lib/systemd/system/" teleport.service
    cd "${srcdir}/teleport"
    install -m755 -t "${pkgdir}/usr/bin/" teleport tctl tsh
    # no man pages, docs or web assets in release tarball
}
