# Maintainer: tuxxx <nzb_tuxxx@proton.me>

pkgbase=subtitles-contact-sheet-qt-git
pkgname=(
  subtitles-contact-sheet-qt-cli-git
  subtitles-contact-sheet-qt-gui-git
)
_pkgname=subtitles_contact_sheet_qt
pkgver=1.11.r2.g8fbc8e5
pkgrel=1
pkgdesc="Create subtitles/video contact sheets, previews, small animations, screenshots and thumbnails"
arch=('x86_64')
url='https://vongoob9.gitlab.io/subtitles_contact_sheet_qt'
license=('GPL-3.0-only')
depends=('qt5-base' 'ffmpeg')
makedepends=('git' 'pandoc-cli')
source=("git+https://gitlab.com/vongooB9/${_pkgname}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  qmake USR_DIR=/usr MAN_DIR=/share/man/man1
  make

  ( cd SCSGUI && qmake USR_DIR=/usr ICONS_DIR=/share/icons/hicolor/scalable/apps && make )
}

package_subtitles-contact-sheet-qt-cli-git() {
  pkgdesc+=' (CLI)'

  cd "${srcdir}/${_pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
}

package_subtitles-contact-sheet-qt-gui-git() {
  pkgdesc+=' (Qt GUI)'

  cd "${srcdir}/${_pkgname}/SCSGUI"
  make INSTALL_ROOT="${pkgdir}" install
}
