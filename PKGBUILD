# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=faudio
pkgver=24.02
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('sdl2' 'gst-libav')
makedepends=('cmake')
source=(https://github.com/FNA-XNA/FAudio/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('de48196bc9d93784d2f2ce20c7aba83066a8a7653781104eb3b15fa8206e54875d5c555dab4c6fb763cf41fd6ec733e71b6bba53c8cafd98af99ea9eb0a3d666')

build() {
  cmake -B build -S FAudio-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 FAudio-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
