# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=3.61.0.12_1
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

sha512sums_x86_64=('b8a90b6531222e2425b0d2c45999d34ddc33189cfd38753964cadfe63f722b2eafa9cc058cf28051e020f7b53b7c4fc1363640dac5eedb953c10c087aa4513a8'
                   'SKIP')
sha512sums_i686=('d6e6d6baa5899bccf03bd02e993879b026f7ee35d9c32d4613666d6fbfa3f9868e9ee40b5062ffafbe772ac99d9eee4b2df5088dc02db22659625bda83a859f0'
                 'SKIP')
sha512sums_armv7h=('0151bfca06833275e8f97f5646d668131722fbcb181d11fb4273b5e15d0d7036800f5f71b3bfc67b9061fa7809cfe34010a999b5379813af9f55786a8e0de5be'
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
