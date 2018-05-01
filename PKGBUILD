# Maintainer: welblade 
# Based on package of: Manuel Kauschinger <admin at bruzzzla dot de>

pkgname=firefox-esr-pt-br-bin
_pkgname=${pkgname/-bin/}
pkgver=52.7.4
pkglang=pt-BR
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk2' 'gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=('firefox=52')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('ca027e5527b6c5d76ef80c3795e160a24327cba93be9f34777b409ada35eaaa48fe9aed28e3f74720ee82e5218f777a6d1ed233f971c7b75e5d3e4d0a2747c64')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='cf037d1f92432152058131ae275eec812f3fa728056dbf7873e0a705deed65281a2657ec2136ee631287318a16de6202703b7602782d7e9be0437246a5acef3b'

source=(http://ftp.mozilla.org/pub/firefox/releases/${pkgver}esr/linux-$CARCH/${pkglang}/firefox-${pkgver}esr.tar.bz2
        $_pkgname.desktop 
        $_pkgname-safe.desktop)

package() {
    cd $srcdir
    
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox/ $pkgdir/opt/$_pkgname

    ln -s /opt/$_pkgname/firefox $pkgdir/usr/bin/$_pkgname
    install -m644 $srcdir/{$_pkgname.desktop,$_pkgname-safe.desktop} $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
}
