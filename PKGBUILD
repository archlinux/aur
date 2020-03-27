# Maintainer: DanManN <dnahimov@gmail.com>
# Library package author: Gabriel Nützi <gnuetzi@gmail.com>

_author=gabyx
_pkgname=ApproxMVBB
pkgname=approxmvbb
pkgver=2.1.2
pkgrel=1
pkgdesc="Fast algorithms to compute an approximation of the minimal volume oriented bounding box of a point cloud in 3D."
arch=('any')
url="http://$_author.github.io/$_pkgname/"
license=('MPL')
depends=('eigen')
makedepends=('cmake')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/$_author/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('301e13a37d5e1e812ff48e53ccca21ee36be79e501d6e9fdd7106a1d72762d42')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	(( NJOB=$(nproc)-1 )) || NJOB=1
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package(){
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
