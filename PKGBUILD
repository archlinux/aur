# Maintainer: Ashley Bone <aur DOT ashley DOT bone AT gmail DOT com>
pkgbase=python-portalocker
pkgname=('python-portalocker' 'python2-portalocker')
_pkgname=portalocker
pkgver=1.5.1
pkgrel=1
pkgdesc='Easy, portable file locking API.'
arch=('any')
url="https://github.com/WoLpH/${_pkgname}"
license=('PSF')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1ed88cff4807267ec3331d2a843529399256043851509c39487db97146dda821')

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
