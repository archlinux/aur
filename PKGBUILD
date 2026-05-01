pkgname=yamp-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Yet Another Music Player - a QML based music player."
arch=('x86_64')
url="https://github.com/Wu28ri/yamp"
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'taglib')
makedepends=('git' 'cmake' 'ninja')
provides=('yamp')
conflicts=('yamp')
source=("git+https://github.com/Wu28ri/yamp.git"
        "yamp.desktop")
sha256sums=('SKIP'
            'e77e30f520c06a20f980efcb1dbf59ba2490129f7a301b5e5ef7e6ff31ef5127')

pkgver() {
  cd "$srcdir/yamp"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/yamp"
  cmake -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/yamp"
  DESTDIR="$pkgdir" cmake --install build
  
  install -Dm644 "$srcdir/yamp.desktop" "$pkgdir/usr/share/applications/yamp.desktop"
}
