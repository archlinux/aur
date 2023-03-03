# Maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

_pkgname=mauikit-calendar
pkgname=$_pkgname-git
pkgver=1.0.1.r0.g889ebdb
pkgrel=1
pkgdesc='MauiKit Calendar components'
url='https://invent.kde.org/maui/mauikit-calendar'
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
         qt5-declarative
         qt5-quickcontrols2
         qt5-svg)
makedepends=(git extra-cmake-modules)
groups=(maui)
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git)
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
