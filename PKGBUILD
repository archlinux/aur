# Maintainer: Bernard Baeyens (berbae)  <berbae52 at sfr dot fr>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=ipager
pkgver=1.1.0
pkgrel=13
pkgdesc="a lightweight beautiful pager from Fluxbox"
arch=('x86_64')
license=('MIT')
#url="http://www.useperl.ru/ipager/index.en.html"
url="http://fluxbox.org/screenshots/"
depends=('imlib2' 'libxmu')
makedepends=('patch' 'scons')
#source=(http://www.useperl.ru/ipager/src/ipager-$pkgver.tar.gz ipager-1.1.0-20120429.patch)
source=(https://slackware.uk/slacky/slackware-13.0/desktop/ipager/1.1.0/src/ipager-1.1.0.tar.gz
        ipager-1.1.0-20120429.patch ipager-1.1.0-20190902.patch ipager-1.1.0-20220521.patch)
install=$pkgname.install
md5sums=('d74409836f5c31eb55a55f00783b1f6f' '073682d8f76e1e91b9d3f2415f4a6c52'
         '3ca6f620f8897122d07e966c10571673' 'e731af2f64ffa6a1c394b3c6e0ff5b17')

prepare() {
cd $srcdir/$pkgname-$pkgver
patch -p0 < $srcdir/ipager-1.1.0-20120429.patch
patch -p0 < $srcdir/ipager-1.1.0-20190902.patch
patch -p0 < $srcdir/ipager-1.1.0-20220521.patch
}

build() {
cd $srcdir/$pkgname-$pkgver
scons
}

package() {
cd $srcdir/$pkgname-$pkgver
scons PREFIX=/usr DESTDIR=$pkgdir install
install -d -m 755 $pkgdir/usr/share/ipager/themes
install -m 644 themes/*.conf $pkgdir/usr/share/ipager/themes
}
# vim:set ts=2 sw=2 et:
