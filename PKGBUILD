# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=buho-git
pkgver=v1.2.1.r10.g610d337
pkgrel=1
pkgdesc="Task and Note Keeper"
arch=('x86_64')
groups=('maui-apps')
url="https://invent.kde.org/maui/buho"
license=('GPL3')
depends=('ki18n' 'qt5-webview' 'mauikit-git' 'kio' 'syntax-highlighting' 'attica' 'mauikit-filebrowsing-git')
makedepends=('git' 'extra-cmake-modules')
provides=('buho')
conflicts=('buho')
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