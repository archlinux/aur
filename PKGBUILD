# Maintainer: Johannes Pfrang <johannespfrang+arch @ gmail.com>
# Co-Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=teleport
pkgver=2.2.7
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('x86_64' 'arm')
url="https://gravitational.com/teleport"
license=('Apache')
depends=('glibc')
install=teleport.install
source_x86_64=("https://github.com/gravitational/teleport/releases/download/v${pkgver}/teleport-v${pkgver}-linux-amd64-bin.tar.gz"
        "teleport.service")
sha256sums_x86_64=('17845cf4c3912a754e261f03889b5ef34515294b55fafdc92f8378aecd0224ae'
            '3e332207cfa984a531044d47fde379a9c242aa92e0fef7804a031dff865396dc')
source_arm=("https://github.com/gravitational/teleport/releases/download/v${pkgver}/teleport-v${pkgver}-linux-arm-bin.tar.gz"
        "teleport.service")
sha256sums_arm=('b41bbac5147eac2b938063ea64b19e85e5419bf71d788122070553d3e0b2d62e'
            '3e332207cfa984a531044d47fde379a9c242aa92e0fef7804a031dff865396dc')
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/lib/systemd/system" "${pkgdir}/usr/bin"
    install -m644 -t "${pkgdir}/usr/lib/systemd/system/" teleport.service
    cd "${srcdir}/teleport"
    install -m755 -t "${pkgdir}/usr/bin/" teleport tctl tsh
    # no man pages, docs or web assets in release tarball
}
