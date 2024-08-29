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
source=(https://github.com/${_base::6}/${_base}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('bf9ebfbd8e694fbb421d8bdb5362a207a3782685d48988e77aed98363b2fa302e7384b570b02b117d45d5509b1633b096d4fc1ef16f65e6cc8c888b863c1e2cb')

build() {
  cd ${_base}-${pkgver}
  pypy3 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --skip-build --optimize='1'
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
