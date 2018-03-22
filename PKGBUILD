# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=nifty_reg
pkgname=niftyreg
pkgver=1.3.9
pkgrel=1
pkgdesc='Open-source software for efficient medical image registration'
arch=('any')
url='http://cmictig.cs.ucl.ac.uk/wiki/index.php/NiftyReg'
license=('BSD')
depends=('zlib' 'libpng')
makedepends=('cmake')
optdepends=('cuda')
provides=()
source=("https://downloads.sourceforge.net/project/niftyreg/nifty_reg-${pkgver}/nifty_reg-${pkgver}.tar.gz")
md5sums=('5d5b5d43cfe14c31a74ea958eee4e41e')

prepare() {
	cd "$srcdir/$_name"

	mkdir build || :
	cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DCMAKE_BUILD_TYPE:STRING=Release \
		-DUSE_OPENMP:BOOL=ON \
		-DUSE_CUDA:BOOL=OFF
}

build() {
	cd "$srcdir/$_name/build"
	make all
}

package() {
	cd "$srcdir/$_name/build"

	make install DESTDIR="${pkgdir}"

	install -D -m644 \
		"$srcdir/$_name/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
