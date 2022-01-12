# Contributor: Thomas Fanninger <thomas@fanninger.at>
_base=e4u
pkgname=python-${_base}
pkgver=0.1rc5
pkgrel=1
epoch=1
pkgdesc="Bundle Library of emoji4unicode at Google"
arch=('any')
url="https://github.com/lambdalisue/${_base}"
license=('custom')
depends=(python-utils python-beautifulsoup4)
makedepends=(python-setuptools)
# options=('!strip' '!emptydirs')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('SKIP')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
