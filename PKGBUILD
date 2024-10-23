# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=psutil
pkgname=pypy3-${_base}
pkgver=6.1.0
pkgrel=1
arch=(x86_64)
url="https://github.com/giampaolo/${_base}"
pkgdesc="Cross-platform lib for process and system monitoring in Python"
license=(BSD-3-Clause)
depends=(pypy3)
makedepends=(pypy3-setuptools)
source=(${url}/archive/release-${pkgver}.tar.gz)
sha512sums=('7dc755c62ad4607b3f34dd60701be86836f9226ac305387205a9dbf2837b6fded6d71f4919323a4e6b77308f9851db560f1bebedb2ae9a9e5fc59ee3adbc4538')

build() {
  cd ${_base}-release-${pkgver}
  pypy3 setup.py build --build-lib=build/python
}

package() {
  cd ${_base}-release-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
  install -D -m 644 LICENSE "$pkgdir/"usr/share/licenses/$pkgname/LICENSE
}
