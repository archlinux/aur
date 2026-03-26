pkgname=zenscii
pkgver=1.0
pkgrel=1
pkgdesc="Convert images and videos into ASCII art (CLI + GUI)"
arch=('x86_64')
url="https://github.com/Just-Utkarsh/Zenscii"
license=('MIT')
depends=('qt6-base' 'ffmpeg' 'imagemagick')
makedepends=('cmake' 'git')
source=("git+https://github.com/Just-Utkarsh/Zenscii.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Zenscii"
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j
}

package() {
  cd "$srcdir/Zenscii"

  install -Dm755 build/zenscii "$pkgdir/usr/bin/zenscii"
  install -Dm755 build/zenscii-gui "$pkgdir/usr/bin/zenscii-gui"

  install -Dm644 assets/zenscii.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/zenscii.svg"

  install -Dm644 zenscii.desktop \
    "$pkgdir/usr/share/applications/zenscii.desktop"
}
