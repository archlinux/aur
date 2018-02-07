# Maintainer: Johannes Pfrang <johannespfrang+arch @ gmail.com>
# Co-Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=teleport
pkgver=2.4.1
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('x86_64' 'arm')
url="https://gravitational.com/teleport"
license=('Apache')
depends=('glibc')
install=teleport.install
source_x86_64=(
    "https://github.com/gravitational/teleport/releases/download/v${pkgver}/teleport-v${pkgver}-linux-amd64-bin.tar.gz"
    "teleport.service"
    )
sha256sums_x86_64=(
    '30649d73d5a6740a42e4691de3eaae10d3885c11bf4eedc626810afdd387f851'
    '3e332207cfa984a531044d47fde379a9c242aa92e0fef7804a031dff865396dc'
    )
source_arm=(
    "https://github.com/gravitational/teleport/releases/download/v${pkgver}/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    "teleport.service"
    )
sha256sums_arm=(
    '1e3ae102e41f4520b2c0e22ec77cbfd15d2de105fe6c77f0f2f084461fc019ca'
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
