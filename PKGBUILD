# Contributor: pfm <vorticity at mail dot ru>
_base=pem
pkgname=python-${_base}
pkgver=21.2.0
pkgrel=1
pkgdesc="Parsing and splitting of PEM files"
arch=(any)
url="https://github.com/hynek/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('7e6f6d46bd1c8ab5c84b0edee182fbec7ae3c37e2005854ff1bc6f43cb47490a1f3bb0ac97cbc9e8c0ff830d4f22fcddd52f68206452a16ba862354a75491b18')

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
