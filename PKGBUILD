# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=lazy-property
pkgname=python-lazy-property
pkgver=0.0.1
pkgrel=1
pkgdesc="A Python package for making properties lazy"
arch=('any')
url="https://github.com/jackmaney/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('c487887203465e67a6b8f71f6bea83d89db84a9064009e38bb4c6daa861a95e0b13d507899635c7f264d571d953dcda01845499ebec3f468d0c9cf06cca0ce4e')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
