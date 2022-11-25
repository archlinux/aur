# Maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

_pkgname=maui-agenda
pkgname=$_pkgname-git
pkgver=0.1.0.r0.gb27824a
pkgrel=1
pkgdesc='Calendar application built with MauiKit'
url='https://github.com/Nitrux/agenda'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(GPL3)
depends=(akonadi-contacts
         calendarsupport
         eventviews
         kconfig
         kcoreaddons
         ki18n
         libakonadi
         mauikit-git
         qt5-base
         qt5-declarative)
makedepends=(git extra-cmake-modules)
groups=(maui)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
