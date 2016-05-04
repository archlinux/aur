# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=1.0.1
pkgrel=2
pkgdesc="Proprietary VPN client for Linux"
arch=('x86_64' 'i686')
url="https://expressvpn.com"
license=('custom')
# net-tools is needed for old skool ifconfig
depends=('net-tools')
_date=$(date +%Y%m%d)
install=expressvpn.install
source=("expressvpnd.service"
        "license-${_date}.html::https://www.expressvpn.com/vpn-software/vpn-linux/open-source")
_url="https://download.expressvpn.xyz/clients/linux"
source_x86_64=("${_url}/${pkgname}_${pkgver}_amd64.deb"{,.asc})
source_i686=("${_url}/${pkgname}_${pkgver}_i386.deb"{,.asc})

sha512sums=('95fa06939cd318962d11076443c0f3fe46f73509fcd09ad39513a8f3ea6d010c9c9607ec38506f1503efde70519a2aa9aed3d201b7c3b37c4324c68fc91a2073'
            'SKIP')
sha512sums_x86_64=('909399d0790b792c098d9327b5d7f79e0bee988f77886bccddf15edb0f8befe1ce40f65b2eff797d7f984c1f51a2223109fc5665a4667c2e02de3f3ae838e39d'
                   'SKIP')
sha512sums_i686=('247f8783a7667176e65edb2e7ee309dbedae77e9395ddd0d3b07c8163c3a93b4a07688b8b475433b8c4c770a60958517438caf27d50565d759230ae8d3c3aad5'
                 'SKIP')
validpgpkeys=('1D0B09AD6C93FEE93FDDBD9DAFF2A1415F6A3A38')

package() {
    # /usr/sbin is a symlink to /usr/bin, rewrite it
    bsdtar -C "${pkgdir}" -xf "${srcdir}/data.tar.gz" -s ":/usr/sbin:/usr/bin:"

    rm -rf "${pkgdir}/etc/init.d"
    install -D "${srcdir}/expressvpnd.service" "${pkgdir}/usr/lib/systemd/system/expressvpnd.service"

    install -Dm644 "${srcdir}/license-${_date}.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}
