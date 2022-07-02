# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=krecorder-git
pkgver=22.06.r5.g3c85cd8
pkgrel=1
pkgdesc="A convergent audio recording application for Plasma"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/krecorder"
license=('GPL3')
depends=('ki18n' 'kconfig' 'qt5-multimedia' 'kirigami2')
makedepends=('git' 'qt5-svg' 'qt5-tools' 'extra-cmake-modules')
provides=('krecorder')
conflicts=('krecorder')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --tags --first-parent --match 'v[0-9][0-9.][0-9.]*' | \
      sed 's=^v==;s=^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)=\1\2=;s=\([0-9]\+-g\)=r\1=;s=-=.=g'
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S "${pkgname%-git}"
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}
