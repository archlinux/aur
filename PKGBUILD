# Contributor: Pierre Chapuis <catwell@archlinux.us>
_base=mailjet-rest
pkgname=python-${_base/-*/}
pkgver=1.3.4
pkgrel=1
pkgdesc="Mailjet V3 API wrapper"
arch=(any)
url="https://pypi.org/project/${_base}"
license=("MIT")
depends=(python-requests)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base/-/_}/${_base/-/_}-${pkgver}.tar.gz)
sha512sums=('ca0ff352b52aa836aa2e2bdeee213dad7f4101c123221b66fb1b1ad02f993d2413bc054328888313f0373fbe9104e66b7b242f18e42489590c2448e410284d6a')

build() {
  cd ${_base/-/_}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base/-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
