# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=gemmi
pkgver=0.6.4
pkgrel=3
pkgdesc="Macromolecular crystallography library and utilities"
arch=('x86_64')
url="https://project-gemmi.github.io"
license=('MPL2')
depends=('python')
makedepends=('gcc-fortran')
source=("https://github.com/project-gemmi/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('507eea6ea112e2b142cc3dfa7de20c25e9f34c76ef77ef3caabfaf94d3657cb3')

prepare() {
	cd "$pkgname-$pkgver"
	 cmake -D USE_FORTRAN=1 -D USE_PYTHON=1 -D BUILD_SHARED_LIBS=ON -D CMAKE_INSTALL_PREFIX=/usr .
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
  # Prepare the directory structure.
  install -dm755 "${pkgdir}/usr"
  install -dm755 "${pkgdir}/usr/lib"

  cp -r "${srcdir}/${pkgname}-${pkgver}/include"  "${pkgdir}/usr/"
  cp -r "${srcdir}/${pkgname}-${pkgver}/libgemmi_cpp.so"  "${pkgdir}/usr/lib/"
}

