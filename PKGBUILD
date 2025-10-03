# Maintainer: tuxxx <nzb_tuxxx@proton.me>

pkgbase=subtitles-contact-sheet-qt
pkgname=(
  subtitles-contact-sheet-qt-cli
  subtitles-contact-sheet-qt-gui
)
_pkgname=subtitles_contact_sheet_qt
pkgver=1.11.1
pkgrel=2
pkgdesc="Create subtitles/video contact sheets, previews, small animations, screenshots and thumbnails"
arch=('x86_64')
url='https://vongoob9.gitlab.io/subtitles_contact_sheet_qt'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'ffmpeg')
makedepends=('pandoc-cli')
optdepends=('ttf-dejavu: default font for scs')
conflicts=('subtitles-contact-sheet-qt-cli-git' 'subtitles-contact-sheet-qt-gui-git')
source=("${_pkgname}-${pkgver}.tar.gz::https://gitlab.com/vongooB9/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('e7e96d71c5101b5c54c2fda068e2359be60d1c0cba15458c78cb4a821aa18b1c700f0c46eb3722595584ed832f3d079063d44d1820d790518f691bfdb122f731')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  qmake6 USR_DIR=/usr MAN_DIR=/share/man/man1
  make

  ( cd SCSGUI && qmake6 USR_DIR=/usr ICONS_DIR=/share/icons/hicolor/scalable/apps && make )
}

package_subtitles-contact-sheet-qt-cli() {
  pkgdesc+=' (CLI)'

  cd "${srcdir}/${_pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}

package_subtitles-contact-sheet-qt-gui() {
  pkgdesc+=' (Qt GUI)'
  depends+=('subtitles-contact-sheet-qt-cli')

  cd "${srcdir}/${_pkgname}-${pkgver}/SCSGUI"
  make INSTALL_ROOT="${pkgdir}" install
}
