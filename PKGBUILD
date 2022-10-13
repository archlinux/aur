# Maintainer: Latif Sulistyo <latipun@aur.archlinux.org>

# shellcheck disable=2034,2154
# shellcheck shell=bash

pkgname=selectdefaultapplication-fork-git
pkgver=r72.4e8501d
pkgrel=1
pkgdesc='A very simple application that lets you define default applications on Linux in a sane way'
arch=('i686' 'x86_64')
url='https://github.com/magnus-ISU/selectdefaultapplication'
license=('GPL')
provides=("selectdefaultapplication")
conflicts=("selectdefaultapplication" "selectdefaultapplication-git")
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd selectdefaultapplication || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd selectdefaultapplication || exit 1
  qmake
  make
}

package() {
  cd selectdefaultapplication || exit 1
  install -dm755 "${pkgdir}/usr/bin/"
  install -m755 selectdefaultapplication "${pkgdir}/usr/bin/"

  install -dm755 "${pkgdir}/usr/share/applications/"
  install -m644 selectdefaultapplication.desktop "${pkgdir}/usr/share/applications/"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/"
  install -m644 selectdefaultapplication.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/"
}
