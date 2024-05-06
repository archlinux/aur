# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-pprintpp-git
pkgdesc="Extension of Python package pycountry providing conversion functions."
url="https://github.com/wolever/pprintpp.git#branch=pprintpp2"
provides=("python-pprintpp")
conflicts=("python-pprintpp")
pkgver=0.4.0.r25.g8731637
pkgrel=2
arch=("any")
license=("BSD")
makedepends=("python-setuptools")
depends=("python")
source=("${pkgname}::git+$url")
b2sums=("SKIP")

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/3.0/4.0/'
}

prepare() {
  cd "${srcdir}/$pkgname"
  sed -i 's?\(\"README.rst\"\), \"U\"?\1?' setup.py
}

build() {
  cd "${srcdir}/$pkgname"
  python setup.py build
}

package() {
  cd "${srcdir}/$pkgname"
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/pprintpp/LICENSE"
}
