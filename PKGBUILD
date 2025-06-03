# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=psutil
pkgname=pypy3-${_base}
pkgver=6.1.1
pkgrel=1
arch=(x86_64)
url="https://github.com/giampaolo/${_base}"
pkgdesc="Cross-platform lib for process and system monitoring in Python"
license=(BSD-3-Clause)
depends=(pypy3)
makedepends=(pypy3-setuptools)
source=(${url}/archive/release-${pkgver}.tar.gz)
sha512sums=('b362446f7154831eba344e7c2a741d0d5b1159b20b58f4642e5cce9599d7dca77d36dac7d69fb6f55fee3c56e384c0c4a86b74f2591df463aeceb50ea6e7b616')

build() {
  cd ${_base}-release-${pkgver}
  pypy3 setup.py build --build-lib=build/python
}

package() {
  cd ${_base}-release-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
  install -D -m 644 LICENSE "$pkgdir/"usr/share/licenses/$pkgname/LICENSE
}
