# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

_gitname="choosealicense-cli"
pkgname="${_gitname}-git"
pkgver=0.3.0.1.g57074b0
pkgrel=1
pkgdesc="Bring http://choosealicense.com to your terminal"
arch=("any")
url="https://github.com/lord63/${_gitname}"
license=("MIT")
depends=("python" "python-click" "python-requests")
makedepends=("git")
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git+https://github.com/lord63/${_gitname}")
md5sums=("SKIP")

pkgver() {
  cd "${_gitname}"
  git describe --tags --long | sed 's/^v//;s/-/./;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build --verbose
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --skip-build --verbose --root="${pkgdir}/" -O1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
