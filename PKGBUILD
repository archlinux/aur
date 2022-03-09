# Contributor: pfm <vorticity at mail dot ru>
_base=txacme
pkgname=python-txacme
pkgver=0.9.3
pkgrel=2
pkgdesc="ACME protocol implementation for Twisted"
arch=(any)
url="https://github.com/twisted/${_base}"
license=(MIT)
depends=(python-acme python-attrs python-pem python-treq python-txsni python-eliot)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('b0a6c6401a9a6d8f8a59c29e34aaf398778f327f5907d4406273b4d0fce6c8449d388a5a687efb25bab5799fd7ddf9a0e2ce482a9b1457d93875a05f593dfa1c')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
