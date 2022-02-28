# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>
_base=weblib
pkgname=python-${_base}
pkgdesc="Set of tools for web scraping projects"
pkgver=0.1.30
pkgrel=1
arch=(any)
url="https://pypi.org/project/${_base}"
license=(MIT)
depends=(python-lxml python-six python-pytils)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('325a52a5fe4d7f5a2f963dc883eeb5b263cdb5bcea1f34a21ac0cf8192921404bf2561c8062d186476a08b636298c07c4cc10dc97239f16816761f8b1793594b')

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
