# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=faudio
pkgver=24.01
_commit=758c90af12c2869ba1e93736faa5e909fcd8a44c
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('sdl2' 'gst-libav')
makedepends=('cmake')
source=(https://github.com/FNA-XNA/FAudio/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('e54d83716789252b8086ef7cd4a5501eadc9819f434b5dad267621db72606e1fd6302ffcb7cfadbcced10e4d8c817aa1dd46ea14755eca0ec4c0dce67fe32bd2')

build() {
  cmake -B build -S FAudio-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 FAudio-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
