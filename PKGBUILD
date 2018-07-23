# Maintainer: Pawel Mosakowski <pawel@mosakowski.net>
pkgname=appgate-sdp
conflicts=('appgate-sdp-headless')
pkgver=4.0.1
pkgrel=1
epoch=
pkgdesc="Software Defined Perimeter - GUI client"
arch=('x86_64')
url="https://www.cyxtera.com/secure-access/appgate-sdp"
license=('custom')
# dependecies taken from provided Ubuntu package
# depends=('alsa-lib' 'atk' 'cairo' 'cups' 'dbus' 'dnsmasq' 'expat' 'fontconfig' 'freetype2'
#         'gcc-libs' 'gconf' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'iptables' 'libappindicator-gtk2'
#         'libxcomposite' 'libsecret' 'libx11' 'libxcb' 'libxcursor' 'libxdamage' 'libxext'
#         'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nodejs' 'nspr' 'nss'
#         'pango' 'procps-ng' 'python' 'python-dbus' 'python-distutils-extra' 'zlib')

# dependecies calculated by namcap
depends=('gconf' 'libsecret' 'gtk3' 'python' 'nss' 'libxss' 'nodejs' 'dnsmasq')
source=("https://sdpdownloads.cyxtera.com/files/download/AppGate-SDP-${pkgver}/clients/${pkgname}_${pkgver}_amd64.deb"
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

md5sums=('fcc77359e74bd728e2dd74acdaf4dc85'
         '002644116e20b2d79fdb36b7677ab4cf')
