# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=faudio
pkgver=21.07
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('sdl2' 'gst-libav')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FNA-XNA/FAudio/archive/$pkgver.tar.gz")
sha512sums=('427f1270e6b8b1030a996e088031af88a8fb3588373cd8210cc5c519da584e0ca81c7224d7fdea2cbf494c80e93d1fa3a7c5ada9dd94d4978fac0702afbbf12f')

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
