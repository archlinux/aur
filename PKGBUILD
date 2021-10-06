# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=fypp
pkgver=3.1
pkgrel=1
pkgdesc="Python powered Fortran preprocessor"
url="https://fypp.readthedocs.io/"
license=("BSD-2-Clause")
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/aradi/fypp/archive/${pkgver}.tar.gz")
sha256sums=('0f66e849869632978a8a0623ee510bb860a74004fdabfbfb542656c6c1a7eb5a')

prepare() {
  cd ${srcdir}
  rm -rf python-build-${CARCH} | true
  cp -r "${pkgname}-${pkgver}" "python-build-${CARCH}"
}

build() {
  msg "Python build for ${CARCH}"
  cd "${srcdir}/python-build-${CARCH}"
  python setup.py build
}

package() {
  cd "${srcdir}/python-build-${CARCH}"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
