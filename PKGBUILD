# Maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

_pkgname=maui-settings
pkgname=$_pkgname-git
pkgver=1.1.0.r0.g4fe5218
pkgrel=1
pkgdesc='Maui Settings Manager is a settings manager for the Maui DE'
url='https://github.com/Nitrux/maui-settings'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(GPL3)
depends=(cask-server-git
         kconfig
         kcoreaddons
         ki18n
         kiconthemes
         maui-core-git
         mauikit-filebrowsing
         mauikit-git
         mauiman-git
         qt5-base
         qt5-declarative)
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
