# Contributor: Dilawar Singh <dilawar.s.rajput@gmail.com

pkgname=smoldyn
pkgver=2.71
pkgrel=1
pkgdesc="particle-based biochemical simulator for modeling molecular diffusion, surface interactions, and chemical reactions"
arch=('i686' 'x86_64')
url="http://www.smoldyn.org"
license=('GPL')
depends=('libtiff' 'freeglut' 'glu' 'libxmu')
makedepends=( 'mesa' 'libtiff' 'freeglut' 'glu' 'libxmu')
source=(http://www.smoldyn.org/${pkgname}-$pkgver.tgz)
b2sums=('d8bd2ca49f13fdb185eded14c467adf8af8a23b62abc8b23a2495231baae43aef34ce1dbc4ba2a85aadcbf2cf483e3b4c8d8326da31e02ac9ba19cac01c8959a')


prepare() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
    cd "$pkgname-$pkgver"
    ctest --output-on-failure
}

package() {
	cd "$$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
