# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=faudio
pkgver=19.11
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('sdl2' 'ffmpeg')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FNA-XNA/FAudio/archive/$pkgver.tar.gz")
sha512sums=('c44e3d0841b9d897a7338ed9a1e51c3494bedda8c4f99ec16974adafe882f782dc5c12fdb79f67f59b70795a84dd9bc6fc9c7c1920ffbc824044e4cb8e93e064')

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
