# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=psutil
pkgname=pypy3-${_base}
pkgver=7.2.2
pkgrel=1
arch=(x86_64)
url="https://github.com/giampaolo/${_base}"
pkgdesc="Cross-platform lib for process and system monitoring in Python"
license=(BSD-3-Clause)
depends=(pypy3)
makedepends=(pypy3-setuptools)
source=(${url}/archive/release-${pkgver}.tar.gz)
sha512sums=('69e5a689ffba4b7a6c345d1228f2ec5c58ba3aeed5cfaebca949e541d73509f3c63cfc9df0230b11a2df84758de5edc449dfb29f0635b36fa57025441cf9cfa6')

build() {
  cd ${_base}-release-${pkgver}
  pypy3 setup.py build --build-lib=build/python
}

package() {
  cd ${_base}-release-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
  install -D -m 644 LICENSE "$pkgdir/"usr/share/licenses/$pkgname/LICENSE
}
