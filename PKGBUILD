# Maintainer: Oswin Krause oswin.krause@di.ku.dk
# Contributor:
pkgname=shark-ml-atlas-git
pkgver=r2995
pkgrel=1
provides=('shark-ml')
conflicts=('shark-ml')
pkgdesc="Shark C++ machine learning library"
arch=('i686' 'x86_64')
url="image.diku.dk/shark"
license=('LGPL3')
depends=('boost>=1.55' 'atlas-lapack')
makedepends=('cmake>=2.8' 'git')
source=('git+https://github.com/Shark-ML/Shark')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/Shark"
	printf "r%s" "$(git rev-list --count HEAD)"
}

build() {
	cd "$srcdir/Shark"
	cmake "-DCMAKE_INSTALL_PREFIX=/usr/" \
	"-DBUILD_EXAMPLES=OFF" "-DBUILD_TESTING=OFF" \
	"-DBUILD_SHARED_LIBS=ON" .
	make
}

package() {
	cd "$srcdir/Shark"
	make DESTDIR="$pkgdir/" install
}
