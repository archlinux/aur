# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>
_base=selection
pkgname=python-${_base}
pkgdesc="API to extract content from HTML & XML documents"
pkgver=0.0.14
pkgrel=1
arch=(any)
url="https://pypi.org/project/${_base}"
license=(MIT)
depends=(python-lxml python-six python-weblib)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('8749f6c589cbc834f676432f90028161aa9eea029a6960859ae4790378e12736c153b485696b9cf00e0e9eff29afee5b63c2fa1ee69c5d563e406cf7149f29cb')

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
