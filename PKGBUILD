# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=maui-clip-git
pkgver=v1.1.1.r1.g909383b
pkgrel=1
pkgdesc="Video player and video collection manager"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
groups=('maui-apps')
url="https://invent.kde.org/maui/clip"
license=('GPL3')
depends=('kio' 'mauikit-git' 'mauikit-filebrowsing-git' 'attica' 'ki18n' 'kcoreaddons' 'mpv')
makedepends=('git' 'extra-cmake-modules' 'qt5-tools' 'qt5-svg')
provides=('cinema' 'maui-clip')
conflicts=('cinema' 'cinema-git' 'maui-clip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd clip
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S clip
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}