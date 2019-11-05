# Maintainer: Danny Holman <dholman@gymli.org>
# Contributor: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=libtmx-git
provides=('libtmx')
pkgver=160.1900b80
pkgrel=1
pkgdesc="Loads .tmx tiled maps in your games."
arch=(any)
url="https://github.com/baylej/tmx/"
license=('BSD')
depends=('zlib' 'libxml2')
makedepends=('cmake')
source=("$pkgname"::'git://github.com/baylej/tmx.git')
sha512sums=('SKIP')

pkgver() {
        cd "$pkgname"
        printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd $pkgname
        mkdir build
        cd build
	cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
        cd $pkgname/build
	make DESTDIR="$pkgdir" install
        cd ..
	install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
