# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=nota-git
pkgver=v1.2.1.r30.gd59b3a2
pkgrel=1
pkgdesc="Multi-platform text editor"
arch=(x86_64)
groups=('maui-apps')
url="https://invent.kde.org/maui/nota"
license=('GPL3')
depends=('ki18n' 'knotifications' 'qt5-svg' 'kio' 'mauikit-git' 'kirigami2' 'syntax-highlighting' 'mauikit-filebrowsing-git')
makedepends=('git' 'extra-cmake-modules')
provides=('nota')
conflicts=('nota')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "${pkgname%-git}"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
