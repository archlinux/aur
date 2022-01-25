# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=3.17.0.8_1
pkgrel=1
pkgdesc="Proprietary VPN client for Linux"
arch=('x86_64' 'i686' 'armv7h')
url="https://expressvpn.com"
license=('custom')
options=(!strip)
install=expressvpn.install
_url="https://www.expressvpn.works/clients/linux"
source_x86_64=("${_url}/${pkgname}_${pkgver/_/-}_amd64.deb"{,.asc})
source_i686=("${_url}/${pkgname}_${pkgver/_/-}_i386.deb"{,.asc})
source_armv7h=("${_url}/${pkgname}_${pkgver/_/-}_armhf.deb"{,.asc})

sha512sums_x86_64=('a43ddac5fd66c9a7d65986f4e918330e263c8a8a7251d460bbebded94325b0998c4e18740528626f6114c56fc65e18e94e31ad0d8e454717eab40c18b491dea8'
                   'SKIP')
sha512sums_i686=('59965228d8c90ae6bff3a4713619d104e7a87f943d7d165f1f326b02358ee60b6cffc1793c792d7095ff3288436e38f15720c853a923e29cad9659cb750566e4'
                 'SKIP')
sha512sums_armv7h=('4fbd1a9511b70d4c94c450565a1466aa569ae81f9bf2ac74e6c7d451470365ed6d41f821d70ab0430d3c3d682172654631fc7ed5208bc1af433c3c6ebe93e45a'
                   'SKIP')
validpgpkeys=('1D0B09AD6C93FEE93FDDBD9DAFF2A1415F6A3A38')

package() {
    # /usr/sbin is a symlink to /usr/bin, rewrite it. Upstream also install files to both /lib and /usr/lib
    # merge these and move to correct location
    bsdtar -C "${pkgdir}" -xf "${srcdir}/data.tar.gz" -s ":/usr/sbin:/usr/bin:" -s ":/usr/lib:/lib:"
    mv "${pkgdir}/lib" "${pkgdir}/usr/"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/share/doc/expressvpn/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

    install -dm755 "${pkgdir}/var/lib/expressvpn/certs"

    # Remove unused /etc
    rm -r "$pkgdir/etc/"
}
