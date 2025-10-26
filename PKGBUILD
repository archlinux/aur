# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=psutil
pkgname=pypy3-${_base}
pkgver=7.1.2
pkgrel=1
arch=(x86_64)
url="https://github.com/giampaolo/${_base}"
pkgdesc="Cross-platform lib for process and system monitoring in Python"
license=(BSD-3-Clause)
depends=(pypy3)
makedepends=(pypy3-setuptools)
source=(${url}/archive/release-${pkgver}.tar.gz)
sha512sums=('5aac35506ca6a2794d5c27eed6717dfc1efe87fe4cad031a0249fa9a2dd27c14aef0a3568ff15dd4d077989c6afe34191f9ec466492a7d7ef9e3e7a92c374fcf')

build() {
  cd ${_base}-release-${pkgver}
  pypy3 setup.py build --build-lib=build/python
}

package() {
  cd ${_base}-release-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
  install -D -m 644 LICENSE "$pkgdir/"usr/share/licenses/$pkgname/LICENSE
}
