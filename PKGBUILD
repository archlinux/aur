# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=fypp
pkgver=3.2
pkgrel=1
pkgdesc="Python powered Fortran preprocessor"
url="https://fypp.readthedocs.io/"
license=("BSD-2-Clause")
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/aradi/fypp/archive/${pkgver}.tar.gz")
sha256sums=('33f48c8d2337db539865265ce33c7c50e4d521aacbd31ac7b7e8b189d771ce1d')

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
