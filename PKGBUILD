# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=dill
pkgname=pypy3-${_base}
pkgver=0.3.8
pkgrel=1
pkgdesc="serialize all of python"
arch=(any)
url="https://github.com/uqfoundation/${_base}"
license=(MIT)
optdepends=('python-objgraph: graph support')
depends=(pypy3)
makedepends=(pypy3-setuptools)
source=(${url}/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('7c42657bbf7ad49ddbee3d1a55d60e2e53b455f5c60a32c3addcc6457fd2574053155ffed16df6cb56fb30eeed75a4c138b1d34f4fb4c5e95fa93bd567edf2a9')

build() {
  cd ${_base}-${pkgver}
  pypy3 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1 --skip-build
  mkdir -p "$pkgdir/usr"
  mv "${pkgdir}/opt/pypy3/bin" "$pkgdir/usr/bin"
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

