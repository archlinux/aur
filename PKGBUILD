# Maintainer: aurel1510 <aurel1510+aur at gmail dot com>

# shellcheck disable=2034,2154
# shellcheck shell=bash

pkgname=selectdefaultapplication-qt6-git
pkgver=r75.e0f76a8
pkgrel=1
pkgdesc='Modern Qt6 GUI tool for managing default applications on Linux. XDG MIME Apps compliant with granular conflict resolution, verbose logging, and cross-desktop compatibility. '
arch=('i686' 'x86_64')
url='https://github.com/THShafi170/selectdefaultapplication-Qt6'
license=('GPL-3.0-or-later')
provides=("sda-qt6")
depends=('qt6-base' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'gcc')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd selectdefaultapplication-Qt6 || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd selectdefaultapplication-Qt6 || exit 1
  cmake -S . -B build
  cmake --build build
}

package() {
  cd selectdefaultapplication-Qt6 || exit 1
  install -dm755 "${pkgdir}/usr/bin/"
  install -m755 build/sda-qt6 "${pkgdir}/usr/bin/"

  install -dm755 "${pkgdir}/usr/share/applications/"
  install -m644 sda-qt6.desktop "${pkgdir}/usr/share/applications/"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/"
  install -m644 sda-qt6.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/"
}

