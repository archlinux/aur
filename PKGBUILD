# Maintainer of this PKBGUILD file: Jose Tascon <josedtascon@gmail.com>
_pkgname=MIRTK
pkgname=mirtk
pkgver=2.0.0
pkgrel=1
pkgdesc='Medical image processing and analysis toolkit'
arch=('any')
url='https://mirtk.github.io/'
license=('Apache')
depends=('eigen' 'boost')
makedepends=('cmake')
optdepends=('python' 'vtk' 'libpng' 'nifticlib')
provides=()
source=("https://github.com/BioMedIA/${_pkgname}/archive/v${pkgver}.zip")
md5sums=('db3cda47a268d8b2cb0081245cbc388a')

prepare() {
	cd "$srcdir/${_pkgname}-${pkgver}"

	mkdir build || :
	cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DCMAKE_BUILD_TYPE:STRING=Release
}

build() {
	cd "$srcdir/${_pkgname}-${pkgver}/build"
	make all
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}/build"

	make install DESTDIR="${pkgdir}"

	install -D -m644 \
		"$srcdir/${_pkgname}-${pkgver}/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}