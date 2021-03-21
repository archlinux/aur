# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=ydotool
pkgver=0.2.0
pkgrel=1
pkgdesc="Generic command-line automation tool (no X!)"
arch=('x86_64')
depends=('libevdevplus' 'libuinputplus')
makedepends=('cmake' 'ninja' 'scdoc')
url="https://github.com/ReimuNotMoe/ydotool"
license=('AGPL3')
source=("$url/archive/v$pkgver.tar.gz"
        "$url/pull/96.patch")
sha256sums=('2311b003d2ff383f3348f17101f0df74f56616d530d66d0a014a52ba85a5dcf1'
            'f462b5f62306a5431e5aa39d1a8ba670300f7304a15cc720af5ded65193eaeda')

prepare() {
  cd "$pkgname-$pkgver"
  patch -sp1 -i ../96.patch
}

build() {
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_MANDIR=/usr/share/man \
    -DCMAKE_BUILD_TYPE=Release \
    -DCXXOPTS_ENABLE_INSTALL=OFF \
    -G Ninja \
    -S "$pkgname-$pkgver" -B build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
