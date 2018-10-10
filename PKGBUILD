# Maintainer: Nikita Puzyryov <PuzyryovN@gmail.com>
pkgname=zchunk
pkgver=0.9.13
pkgrel=1
pkgdesc="A file format that allows easy deltas while maintaining good compression"
arch=(x86 x86_64)
url="https://github.com/zchunk/zchunk"
license=('BSD')
depends=('libcurl.so' 'zstd')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f95e26864e2e0c15b7ee7d15b2601bcad0401b3a748233ae663de34cda4d67cd')

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
