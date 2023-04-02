# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=faudio
pkgver=23.04
_commit=2d3c6cef46f479393c09f3bc58838b06763095b5
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('sdl2' 'gst-libav')
makedepends=('git' 'cmake' 'ninja')
source=("git+https://github.com/FNA-XNA/FAudio.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../FAudio -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DGSTREAMER=ON
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 FAudio/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
