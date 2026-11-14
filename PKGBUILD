# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=pcmanfm-qt-git
_pkgname="${pkgname%-git}"
pkgver=2.4.1.r16.g11cc9ab
pkgrel=1
pkgdesc='The LXQt file manager, Qt port of PCManFM'
arch=('i686' 'x86_64' 'aarch64')
url='https://lxqt-project.org'
license=('GPL-2.0-only')
depends=('desktop-file-utils' 'libfm-qt-git' 'layer-shell-qt')
optdepends=(
  "gvfs: Advanced data storage features like mounting without root, remote filesystems, encrypted filesystems, see https://github.com/lxqt/pcmanfm-qt/wiki".
  "gvfs-mtp: MTP support (Media Transfer Protocol)"
  "lxqt-archiver: Archive management GUI."
  "qt6-translations: Localized keyboard shortcuts in some languages (e.g. German)."
)
makedepends=('git' 'lxqt-build-tools-git' 'qt6-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/lxqt/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
  cmake -S ${_pkgname} -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
