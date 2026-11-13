# Maintainer: Boris Brock <gabrielborisbrock@gmail.com>
pkgname=replayer
pkgver=1.5.1
pkgrel=1
pkgdesc='Video player for action cam footage with frame-by-frame and slow-motion playback'
arch=('x86_64' 'aarch64')
url='https://github.com/BorisBrock/Replayer'
license=('GPL-3.0-only')
depends=('ffmpeg' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'qt6-base')
makedepends=('cmake' 'qt6-svg')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8427e36461f73d2243d303145c32a1e5882fb10a97349a30496b8a2823f24115')

build() {
  cmake -B build -S "Replayer-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_DOCDIR="share/doc/$pkgname" \
    -DREPLAYER_VERSION="$pkgver" \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "Replayer-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
