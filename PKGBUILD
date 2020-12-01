# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=faudio
pkgver=20.12
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('sdl2' 'gst-libav')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FNA-XNA/FAudio/archive/$pkgver.tar.gz")
sha512sums=('fa78527fbd124d1f38526cb0ed95eebfe37c92f9631b94277fcd18f921fa912cf7fe20e83d77a5c3f26f837eb8f63b33377fb612d8e7433dc13d2e1ccb8d6fc9')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../FAudio-$pkgver -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DGSTREAMER=ON
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 FAudio-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
