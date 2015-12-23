# Maintainer: archshift

_pkgname=adusk
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
pkgdesc="A standalone virtual keyboard for the Steam Controller"
arch=('i686' 'x86_64')
url="https://github.com/archshift/adusk"
license=('GPL3')
makedepends=('git' 'python-setuptools')
depends=('python' 'python-steamcontroller-git' 'python-pysdl2')
provides=("$_pkgname")
source=("$_pkgname::git+https://github.com/archshift/adusk.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}" --prefix="/usr"
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
