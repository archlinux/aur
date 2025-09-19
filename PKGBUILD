# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=psutil
pkgname=pypy3-${_base}
pkgver=7.1.0
pkgrel=1
arch=(x86_64)
url="https://github.com/giampaolo/${_base}"
pkgdesc="Cross-platform lib for process and system monitoring in Python"
license=(BSD-3-Clause)
depends=(pypy3)
makedepends=(pypy3-setuptools)
source=(${url}/archive/release-${pkgver}.tar.gz)
sha512sums=('06db8809a3fb8bbd7ed6ed0bb94311d83e3d4f07760eaa931ea59ef16cd3ec65ddd3b1b39a28ec21cfffd718a604f53411f4fc19b01b29dcce39eca41e9fafe2')

build() {
  cd ${_base}-release-${pkgver}
  pypy3 setup.py build --build-lib=build/python
}

package() {
  cd ${_base}-release-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
  install -D -m 644 LICENSE "$pkgdir/"usr/share/licenses/$pkgname/LICENSE
}
