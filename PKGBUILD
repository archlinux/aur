# Contributor: pfm <vorticity at mail dot ru>
_base=txsni
pkgname=python-${_base}
pkgver=0.2.0
pkgrel=3
pkgdesc="Simple support for running a TLS server with Twisted"
arch=(any)
url="https://github.com/glyph/${_base}"
license=(MIT)
depends=(python-pyopenssl python-twisted)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c03d2a3b3527954371ec6878a952490816c8bbbad3181b14d4d1586410e1dd9a7c4e8074f3e11ad6a19b5963e36ec3e797ef6dd7556bfdf0b4c62161ed16e829')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
