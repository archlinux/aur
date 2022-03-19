# Contributor: Simone Riva <simone.rva@gmail.com>
_base=rawpy
pkgname=python-${_base}
pkgver=0.17.0
pkgrel=1
pkgdesc="Python wrapper for the LibRaw library"
arch=(any)
license=(MIT)
url="https://github.com/letmaik/rawpy"
depends=(libraw python-numpy)
makedepends=(python-setuptools cython)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f50846d5cb0caedda4c6e512edcc166b8ecf012f79eb98187d735799ead9606377a289992ffc0b9c3abe826ef84cf5c42505441d69633525286f8ccf4915cb26')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package_python-rawpy() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
