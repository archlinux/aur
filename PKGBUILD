# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=maui-clip-git
pkgver=r98.1d1c5aa
pkgrel=1
pkgdesc="Video player and video collection manager"
arch=('x86_64')
groups=('maui-apps')
url="https://invent.kde.org/maui/clip"
license=('GPL3')
depends=('kio' 'mauikit-git' 'mauikit-filebrowsing-git' 'attica' 'ki18n' 'kcoreaddons')
makedepends=('git' 'extra-cmake-modules' 'qt5-tools')
provides=('cinema' 'maui-clip')
conflicts=('cinema' 'cinema-git' 'maui-clip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd clip
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S clip
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
