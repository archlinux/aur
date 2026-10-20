# Maintainer: Boris Brock <gabrielborisbrock@gmail.com>
pkgname=replayer
pkgver=1.4.0
pkgrel=1
pkgdesc='Video player for action cam footage with frame-by-frame and slow-motion playback'
arch=('x86_64' 'aarch64')
url='https://github.com/BorisBrock/Replayer'
license=('GPL-3.0-only')
depends=('ffmpeg' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'qt6-base')
makedepends=('cmake' 'qt6-svg')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0cace81655fff459ce8921353dfb6ed3a790486ae9e38e89638f4e8d8b9c7f24')

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
