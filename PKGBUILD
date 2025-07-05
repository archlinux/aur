# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=karton-git
pkgver=0.1.prealpha.r28.fdfaef8
pkgrel=1
pkgdesc='A Libvirt-based Virtual Machine Manager for KDE'
arch=(x86_64)
url='https://invent.kde.org/sitter/karton'
license=(GPL-3.0-or-later)
depends=(gcc-libs
         glib2
         glibc
         kcoreaddons
         ki18n
         kiconthemes
         kirigami
         libosinfo
         libvirt
         qqc2-desktop-style
         qt6-base
         qt6-declarative
         virt-viewer)
makedepends=(git
             extra-cmake-modules
             vulkan-headers)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://invent.kde.org/sitter/karton.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cmake -B build -S "${pkgname%-git}" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
