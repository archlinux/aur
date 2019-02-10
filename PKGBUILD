# Maintainer: Pawel Mosakowski <pawel@mosakowski.net>
pkgname=appgate-sdp
conflicts=('appgate-sdp-headless')
pkgver=4.2.1
_download_pkgver=4.2
pkgrel=1
epoch=
pkgdesc="Software Defined Perimeter - GUI client"
arch=('x86_64')
url="https://www.cyxtera.com/essential-defense/appgate-sdp/support"
license=('custom')

# dependecies calculated by namcap
depends=('gconf' 'libsecret' 'gtk3' 'python' 'nss' 'libxss' 'nodejs' 'dnsmasq')
source=("https://sdpdownloads.cyxtera.com/AppGate-SDP-${_download_pkgver}/clients/${pkgname}_${pkgver}_amd64.deb"
        "appgatedriver.service")

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dpr "${srcdir}"/{etc,lib,opt,usr} "${pkgdir}"
    mv -v "$pkgdir/lib/systemd/system" "$pkgdir/usr/lib/systemd/"
    rm -vrf "$pkgdir/lib"

    cp -v "$srcdir/appgatedriver.service" "$pkgdir/usr/lib/systemd/system/appgatedriver.service"
    
    mkdir -vp "$pkgdir/usr/share/licenses/appgate-sdp"
    cp -v "$pkgdir/usr/share/doc/appgate/copyright" "$pkgdir/usr/share/licenses/appgate-sdp"
    cp -v "$pkgdir/usr/share/doc/appgate/LICENSE.github" "$pkgdir/usr/share/licenses/appgate-sdp"
    cp -v "$pkgdir/usr/share/doc/appgate/LICENSES.chromium.html.bz2" "$pkgdir/usr/share/licenses/appgate-sdp"
}

md5sums=('7ecef2f9033ed09dec081084446deaee'
         '002644116e20b2d79fdb36b7677ab4cf')
