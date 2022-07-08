# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=3.27.1.0_1
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

sha512sums_x86_64=('af0ad1e2ce4745e37ac69b8936a814072c2e30c5e6dfce80014099c315341357b97aaf99c35dd743709286fc9f0297205eb76f71a51e4eddc159f14047fc3651'
                   'SKIP')
sha512sums_i686=('44a935a7749fd28e53eb1cc7ca1068c898bb05e12a1a21785ccbb596514e6dad4234c0e0993be74f6c85e61655688c3a1f0fc88d821ffbf0ad58d9a8be81d543'
                 'SKIP')
sha512sums_armv7h=('f3b4084a4f4cb78232043c528e4e9d5193f53168bf49748e83689e2695930a5e8739a4b4c240fadbde314041820d251c970cb28030847b2b32b7ec2d7c389743'
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
