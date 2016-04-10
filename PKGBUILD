# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=1.0
pkgrel=4
pkgdesc="ExpressVPN client for Linux"
arch=('x86_64' 'i686')
url="https://expressvpn.com"
license=('custom')
# net-tools is needed for old skool ifconfig
depends=('net-tools')
source=("expressvpnd.service"
        "license.html::https://www.expressvpn.com/vpn-software/vpn-linux/open-source")
_url="https://download.expressvpn.xyz/clients/linux"
source_x86_64=("${_url}/${pkgname}_${pkgver}_amd64.deb"{,.asc})
source_i686=("${_url}/${pkgname}_${pkgver}_i386.deb"{,.asc})

sha512sums=('95fa06939cd318962d11076443c0f3fe46f73509fcd09ad39513a8f3ea6d010c9c9607ec38506f1503efde70519a2aa9aed3d201b7c3b37c4324c68fc91a2073'
            'ddaaf5c7f26a0fc0deb7b083b96ca11c5eae5b2b7c834fc93bcb8ee1e0f2ab79900e088d349069b457c344cd519151efa034fa7ae9134cafa245d2ac1138540a')
sha512sums_x86_64=('3443c56ff1b827048c9494d8b3ccbc77e4124650937976cea70d9fc0a4fed894b76a724b9628bb66a6be0fb5a5dfc7ffa8073ebccc20676a3d8571282af7f4c6'
                   'SKIP')
sha512sums_i686=('6b80b2fb3e65f6572cb32e0d585dc370c4889498e2e7fa22b61e136379976c09614b8a289482c4ff66a5e104b384d8b52398c346025425bcadf0d96411bff752'
                 'SKIP')
validpgpkeys=('1D0B09AD6C93FEE93FDDBD9DAFF2A1415F6A3A38')

package() {
    # /usr/sbin is a symlink to /usr/bin, rewrite it
    bsdtar -C "${pkgdir}" -xf "${srcdir}/data.tar.gz" -s ":/usr/sbin:/usr/bin:"

    rm -rf "${pkgdir}/etc/init.d"
    install -D "${srcdir}/expressvpnd.service" "${pkgdir}/usr/lib/systemd/system/expressvpnd.service"

    install -Dm644 "$srcdir/license.html" "$pkgdir/usr/share/licenses/$pkgname/license.html"
}
