pkgname=yamp-git
pkgver=r167.dcca66e
pkgrel=1
pkgdesc="Yet Another Music Player - a QML based music player."
arch=('x86_64')
url="https://github.com/Wu28ri/yamp"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc' 'libstdc++' 'libglvnd' 'zlib'
         'qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-imageformats'
         'qqc2-desktop-style' 'breeze-icons' 'hicolor-icon-theme'
         'mpv' 'taglib' 'libpulse' 'alsa-lib')
makedepends=('git' 'cmake' 'ninja')
provides=('yamp')
conflicts=('yamp')
source=("git+https://github.com/Wu28ri/yamp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/yamp"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/yamp"
  cmake -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DYAMP_LICENSE_INSTALL_DIR="/usr/share/licenses/$pkgname" \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/yamp"
  DESTDIR="$pkgdir" cmake --install build
}
