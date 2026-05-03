# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=pcmanfm-qt-git
_pkgname="${pkgname%-git}"
pkgver=2.1.0
pkgrel=2
pkgdesc='The LXQt file manager, Qt port of PCManFM'
arch=(i686 x86_64)
url='https://lxqt-project.org'
license=('GPL-2.0-only')
depends=(
  gcc-libs
  glib2
  glibc
  hicolor-icon-theme
  layer-shell-qt
  libfm-qt-git
  libxcb
  lxqt-menu-data-git
  qt6-base
)
makedepends=(
  cmake
  git
  lxqt-build-tools-git
  qt6-tools
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/lxqt/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
  cd "${_pkgname}"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
}
