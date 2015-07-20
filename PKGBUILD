# $Id$
# Maintainer:  Samuel Creshal <samuel@creshal.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sebastian A. Liem <sebastian at liem dot se>

pkgname=slockd
pkgver=1.2
pkgrel=2
conflicts=('slock')
replaces=('slock')
pkgdesc="A simple screen locker for X, daemonizing"
arch=('i686' 'x86_64')
url="http://tools.suckless.org/slock"
license=('MIT')
depends=('libxext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/creshal/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('77d211eb9a9eb3a471f991ded749939be9efa1de92ce2fb1e46c23a56bda589a22ed8e432117e742beae7dc6df8e63208578a59c7963619ab50db2badf71097e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

