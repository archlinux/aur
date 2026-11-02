# Maintainer: safalski <https://git.safallama.com.np/safalski>
pkgname=jankk
pkgver=0.1.3
pkgrel=1
_ryu_commit=200007fb1be91a9a3eb4cc642733865d3f74f447
pkgdesc="A GBA game launcher and emulator frontend built with Qt and mGBA"
arch=('x86_64')
url="https://github.com/Happilli/_jankk"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia-ffmpeg' 'qt6-svg' 'qt6-shadertools' 'libmgba' 'lua')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Happilli/_jankk/archive/refs/tags/v$pkgver.tar.gz"
        "ryu-$_ryu_commit.tar.gz::https://github.com/Happilli/ryu/archive/$_ryu_commit.tar.gz")
sha256sums=('af3e85e2420511d693ffaedc7a7399f003f3335789dd167b6907162807b672b8'
            'f2a61e2899c966488cf35409faeefd293271e6f694825ad710d61c402c7b29c2')

prepare() {
  cp -a "$srcdir/ryu-$_ryu_commit/." "$srcdir/_jankk-$pkgver/third_party/ryu/"
}

build() {
  cmake -B build -S "_jankk-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
