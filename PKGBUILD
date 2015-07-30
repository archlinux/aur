# Maintainer: Sergio Correia <sergio@correia.cc>

_pkgname=qt5-leveldb
pkgname=${_pkgname}-git
pkgver=r55.aeb17e4
pkgrel=1
pkgdesc="Qt/QML wrapper for Google's LevelDB"
arch=("i686" "x86_64")
url="https://qt-project.org/"
license=("custom")
depends=("qt5-declarative>=5.5.0")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/paulovap/qtleveldb.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  qmake
  make
}

package() {
  cd "${_pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# vim:set ts=2 sw=2 et:
