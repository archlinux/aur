# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=faudio
pkgver=19.04
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('sdl2' 'ffmpeg')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FNA-XNA/FAudio/archive/$pkgver.tar.gz")
sha512sums=('00b6cb425719520a55114d1b5d6e53123e9ad485c1fc615c677999622e1e7cd25976ee454222a42e30f3168258dd2b523146392777d0b399bac7cd9f90ed5944')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../FAudio-$pkgver -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DFFMPEG=ON
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 FAudio-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
