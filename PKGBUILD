# Maintainer: Nikita Puzyryov <PuzyryovN@gmail.com>
pkgname=zchunk
pkgver=0.7.4
pkgrel=1
pkgdesc="A file format that allows easy deltas while maintaining good compression"
arch=(x86 x86_64)
url="https://github.com/zchunk/zchunk"
license=('BSD')
depends=('libcurl.so' 'zstd')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9c8f3c250792c1a26d132a948be7f87ec320efce3e05eebad8041fb024209654')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  arch-meson build/
  ninja -C build/
}

check() {
  cd "$srcdir/$pkgname-$pkgver/build"
  meson test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build/ install
}
