# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgbase=python-portalocker
pkgname=('python-portalocker' 'python2-portalocker')
_pkgname=portalocker
pkgver=1.7.0
pkgrel=1
pkgdesc='Easy, portable file locking API.'
arch=('any')
url="https://github.com/WoLpH/${_pkgname}"
license=('PSF')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('091364838ed6fbb68ea291c28982d1e56125c0d9e3fad5a4ac001db54dd862dc')

build() {
  cp -a "${_pkgname}-${pkgver}" "py2-${_pkgname}-${pkgver}"

  msg "Building Python 2 version."
  cd "${srcdir}/py2-${_pkgname}-${pkgver}"
  python2 setup.py build

  msg "Building Python 3 version."
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py build
}

package_python2-portalocker() {
  depends=('python2')
  cd "py2-${_pkgname}-${pkgver}"
  python2 setup.py install --prefix='/usr' --root="${pkgdir}" --optimize=1
}

package_python-portalocker() {
  depends=('python')
  cd "${_pkgname}-${pkgver}"
  python setup.py install --prefix='/usr' --root="${pkgdir}" --optimize=1
}
