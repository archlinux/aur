# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=3.12.0.10_1
pkgrel=1
pkgdesc="Proprietary VPN client for Linux"
arch=('x86_64' 'i686' 'armv7h')
url="https://expressvpn.com"
license=('custom')
_date=$(date +%Y%m%d)
options=(!strip)
install=expressvpn.install
source=("license-${_date}.html::https://www.expressvpn.com/vpn-software/vpn-linux/open-source")
_url="https://www.expressvpn.works/clients/linux"
source_x86_64=("${_url}/${pkgname}_${pkgver/_/-}_amd64.deb"{,.asc})
source_i686=("${_url}/${pkgname}_${pkgver/_/-}_i386.deb"{,.asc})
source_armv7h=("${_url}/${pkgname}_${pkgver/_/-}_armhf.deb"{,.asc})

sha512sums=('SKIP')

sha512sums_x86_64=('ebdba2ca097362f14e6d36f48e0276a065ad032aae1c0e8fab74e2a9323f114b12414f0e970e6f996adc68bdb92665455cdb4bd963d5d226270d68c61c8d4673'
                   'SKIP')
sha512sums_i686=('c4d4a620ab84e3834a04bba06e28c5a194f03f9082decb24beb278740ed9f82c745f67ecdebaf50714afbe2bd960d1a88c4c127518d98d623f2a5be1b10cdf29'
                 'SKIP')
sha512sums_armv7h=('0717f99333c0d7d4e81805f2f81102f4ef0f74ca03f7d6e5c3c6839304ca68a2f9c2be42fb998d27199db864dbc908cae003381541124b367aee41666f123dc1'
                   'SKIP')


validpgpkeys=('1D0B09AD6C93FEE93FDDBD9DAFF2A1415F6A3A38')

package() {
    # /usr/sbin is a symlink to /usr/bin, rewrite it. Upstream also install files to both /lib and /usr/lib
    # merge these and move to correct location
    bsdtar -C "${pkgdir}" -xf "${srcdir}/data.tar.gz" -s ":/usr/sbin:/usr/bin:" -s ":/usr/lib:/lib:"
    mv "${pkgdir}/lib" "${pkgdir}/usr/"

    install -Dm644 "${srcdir}/license-${_date}.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
    install -dm755 "${pkgdir}/var/lib/expressvpn/certs"

    # Remove unused /etc
    rm -r "$pkgdir/etc/"
}
