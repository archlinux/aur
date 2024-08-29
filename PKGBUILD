# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=pybind11
pkgname=pypy3-${_base}
pkgver=2.13.5
pkgrel=1
pkgdesc="A lightweight header-only library that exposes C++ types in Python and vice versa"
arch=(any)
url="https://${_base}.readthedocs.org"
license=(BSD-3-Clause)
depends=(pypy3)
makedepends=(cmake boost eigen pypy3-setuptools)
optdepends=('pypy3-setuptools: for python bindings')
source=("https://github.com/${_base}/${_base}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6bd528c4dbe2276635dc787b6b1f2e5316cf6b49ee3e150264e455a0d68d19c1')

build() {
  cd ${_base}-${pkgver}
  pypy3 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --skip-build --optimize='1'
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
