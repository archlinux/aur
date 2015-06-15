# Contributor: Maato <maato softwarebakery com>
# Maintainer: Natrio <natrio list ru>

pkgname=volumeicon-toggle
_pkgname=volumeicon
pkgver=0.4.6
pkgrel=3
pkgdesc="Volume control for your system tray."
arch=('i686' 'x86_64')
url="http://www.softwarebakery.com/maato/volumeicon.html"
license=('GPL3')
depends=('gtk2>=2.16.0' 'alsa-lib')
provides=('volumeicon')
conflicts=('volumeicon')
source=(http://www.softwarebakery.com/maato/files/$_pkgname/$_pkgname-$pkgver.tar.gz 'toggleslider.patch' 'glib.patch')
md5sums=('7fd6dffba823e9c529d151d4789ff992' 'd3a05ab6491c9c238a406738196931da' 'b2db938600cf4173928b85e2526391ae')

build() {
 cd "$srcdir/$_pkgname-$pkgver"
 patch -p1 < $srcdir/toggleslider.patch || return 1
 patch -p1 < $srcdir/glib.patch || return 1
 ./configure --prefix=/usr
 make || return 1
}
package() {
 cd "$srcdir/$_pkgname-$pkgver"
 make DESTDIR="$pkgdir/" install
}
