# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=faudio
pkgver=24.03
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('sdl2' 'gst-libav')
makedepends=('cmake')
source=(https://github.com/FNA-XNA/FAudio/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('c5b6a6b672095bc2a3d303cee591a8bceecef3ccba417b2023f6ae927143e0524495daea2d4cc2880b09de632a805e291db5894d7cb910535743b2025f14b712')

build() {
  cmake -B build -S FAudio-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 FAudio-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
