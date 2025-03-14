# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kalk-git
pkgver=24.01.90.r155.gb9b0a7c
pkgrel=1
pkgdesc="A powerful cross-platform calculator application built with the Kirigami framework"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://apps.kde.org/kalk/"
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=('kconfig' 'kcoreaddons' 'ki18n' 'kirigami' 'kirigami-addons' 'kunitconversion' 'libqalculate' 'qqc2-desktop-style')
makedepends=('git' 'extra-cmake-modules')
provides=('kalk')
conflicts=('kalk')
source=("git+https://invent.kde.org/utilities/kalk")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%%-git}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S "${pkgname%-git}"
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}
