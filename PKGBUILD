# Maintainer: Sergio Correia <sergio@correia.cc>

_pkgname=qt5-pdfium
pkgname=${_pkgname}-git
pkgver=r9.cf0140c
pkgrel=1
pkgdesc="Qt/QML wrapper for PDFium open-source PDF rendering engine."
arch=("i686" "x86_64")
url="https://github.com/paulovap/qtpdfium/"
license=("BSD")
depends=('qt5-base>=5.5.0')
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/paulovap/qtpdfium.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  git submodule update --init
}

build() {
  cd "${_pkgname}"
  qmake
  make
}

package() {
  cd "${_pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
  install -D -m644 $(pwd)/src/3rdparty/pdfium/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# vim:set ts=2 sw=2 et:
