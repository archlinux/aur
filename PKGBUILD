# Maintainer: Maxime Morel <maxime@mmorel.eu>

pkgname=opentrack-git
pkgver=r2966
pkgrel=1
pkgdesc="An application dedicated to tracking user's head movements and relaying the information to games and flight simulation software"
arch=('i686' 'x86_64')
url="https://github.com/opentrack/opentrack/"
license=('GPL3')
depends=('qt5-base' 'opencv-git')
makedepends=('git' 'cmake')
provides=('opentrack')
conflicts=('opentrack')
source=("git+https://github.com/opentrack/opentrack.git" "opentrack.desktop")
sha256sums=('SKIP'
            'e39d8d68739f875393c4b0bec61aacf5d2fa7970327c82d9b4e97f643e4fb0cc')

pkgver() {
  cd "$srcdir/opentrack"
  printf "r%s" "$(git rev-list --count HEAD)"
}

build() {
  cd opentrack
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DSDK_ENABLE_LIBEVDEV=ON -DCMAKE_INSTALL_PREFIX=/opt/opentrack ..
  make
}

package() {
  cd opentrack/build
  make DESTDIR="$pkgdir" install

  install -Dm644 $srcdir/opentrack.desktop $pkgdir/usr/share/applications/opentrack.desktop
}

