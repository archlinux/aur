# Maintainer: wheat32
# Previous Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Previous Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn3
pkgver=3.83.0.2_1
pkgrel=1
pkgdesc="Proprietary VPN client for Linux"
arch=('x86_64' 'i686' 'armv7h')
depends=('glibc')
provides=('expressvpn')
conflicts=('expressvpn' 'expressvpn-staging' 'expressvpn-beta')
url="https://expressvpn.com"
license=('LicenseRef-custom')
options=(!strip)
install=expressvpn.install
_url="https://www.expressvpn.works/clients/linux"
source_x86_64=("${_url}/${pkgname}_${pkgver/_/-}_amd64.deb"{,.asc})
source_i686=("${_url}/${pkgname}_${pkgver/_/-}_i386.deb"{,.asc})
source_armv7h=("${_url}/${pkgname}_${pkgver/_/-}_armhf.deb"{,.asc})

sha512sums_x86_64=('3090e8869fa142c96eda68fd0167138da5889a340102c910cd07b67b838b3d6448800ed768744250d11b99011665736d083f9debbc8c14b5b2e481addf887264'
                   'SKIP')
sha512sums_i686=('ec23a703e37f7b25cf4cab30928f08bc013adb04f777858359810f63a1b92d4a9a1272f2c988f5228321616d879ce9ca8aac5abcb5eab452a5108517080b286c'
                 'SKIP')
sha512sums_armv7h=('fabe8b634bdd9c9f1d7551e7975cf74de7673eaa8154fe3d29905a7de26baf85896306dd302826aa15fbb46aa5885335a8927c96ff72e7b4b5debfa16fb5cd32'
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
