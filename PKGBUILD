# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=pix-maui-git
pkgver=v1.2.2.r1.ga2c28da
pkgrel=1
pkgdesc="Image gallery application"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
groups=('maui-apps')
url="https://invent.kde.org/maui/pix"
license=('GPL3')
depends=('ki18n' 'qt5-location' 'mauikit-git' 'kio' 'syntax-highlighting' 'kquickimageeditor'
         'attica' 'exiv2' 'mauikit-git' 'mauikit-filebrowsing-git' 'mauikit-imagetools-git')
makedepends=('git' 'extra-cmake-modules' 'qt5-svg' 'qt5-tools')
provides=('pix-maui' 'maui-pix')
conflicts=('pix-maui' 'maui-pix')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd pix
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S pix
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}