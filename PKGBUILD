# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
# Previous Maintainer: Will Adams <info at clementlumber dot com>
# Previous Maintainer: T. Jameson Little <t.jameson.little at gmail dot com>
# Previous Maintainer: Stephen Michael <ihateseptictanks at gmail dot com>
# Previous Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr-bin
_pkgname=${pkgname/-bin/}
pkgver=102.8.0
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=(firefox=${pkgver})
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('bd4431c7f64b9832eeddcb04906356ca1d95d96a91c0ae9affabe2669c7eab27b8ee28fba5ca8889bffdd2be004a84cd90a8d8701d034a60537a04f8cb8c3bf1'
            'c585f6e8ac7abfc96ad4571940b6f0dcc3f7331a18a518b4fe5d19b45e4c2d96c394524ea5c115c8fdd256c9229ea2fabeb1fc04ca7102f1626fd20728aef47d'
            'ab2fa2e08c7a65ac0bfe169a4b579e54b038bddabf838cd3df5ab341bd77be7c101092d0123598944d2174ab3a8fbc70dfbd692b2944016efdb7a69216a74428')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='62e364d289f935549d83d44c9db4484815a0c2c2ccbbb7323940f2a7a78697e4e64b5bebdbe9fc1724a51b510f010be01465012f0474aa3d955fd484ecb8ca37'

source=(https://ftp.mozilla.org/pub/firefox/releases/${pkgver}esr/linux-$CARCH/en-US/firefox-${pkgver}esr.tar.bz2
        $_pkgname.desktop 
        $_pkgname-safe.desktop)

package() {
    cd $srcdir
    
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox/ $pkgdir/opt/$_pkgname

    ln -s /opt/$_pkgname/firefox $pkgdir/usr/bin/$_pkgname
    install -m644 $srcdir/{$_pkgname.desktop,$_pkgname-safe.desktop} $pkgdir/usr/share/applications/
	install -m644 $srcdir/firefox/browser/chrome/icons/default/default128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
}



