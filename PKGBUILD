# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=pix-maui-git
pkgver=v1.2.1.r34.geb52869
pkgrel=2
pkgdesc="Image gallery application"
arch=('x86_64')
groups=('maui-apps')
url="https://invent.kde.org/maui/pix"
license=('GPL3')
depends=('ki18n' 'qt5-location' 'mauikit-git' 'kio' 'syntax-highlighting'
         'attica' 'exiv2' 'kquickimageeditor' 'mauikit-filebrowsing-git' 'mauikit-imagetools-git')
makedepends=('git' 'extra-cmake-modules')
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
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S pix
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}