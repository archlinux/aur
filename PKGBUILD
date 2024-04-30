# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=gemmi
pkgver=0.6.5
pkgrel=1
pkgdesc="Macromolecular crystallography library and utilities"
arch=('x86_64')
url="https://project-gemmi.github.io"
license=('MPL2')
depends=('python')
makedepends=('gcc-fortran')
source=("https://github.com/project-gemmi/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9159506a16e0d22bbeeefc4d34137099318307db1b2bebf06fb2ae501571b19c')

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

