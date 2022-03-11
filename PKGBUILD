# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hse
pkgver=2.1.1
pkgrel=1
pkgdesc="Heterogeneous-memory storage engine"
arch=('i686' 'x86_64')
url="https://hse-project.github.io/"
license=('apache')
depends=('glibc' 'cjson' 'curl' 'libbsd' 'libmicrohttpd' 'liburcu' 'libyaml' 'lz4' 'mongo-c-driver' 'pmdk' 'xxhash')
makedepends=('meson')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/hse-project/hse/archive/refs/tags/r$pkgver.tar.gz")
sha256sums=('7cdc29214f4a4bde49be2fc6f4f6b910c29d4df5a931f975cb05c657414b2768')


build() {
  cd "$pkgname-r$pkgver"

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    -Dforce_fallback_for="cjson,xxhash" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "$pkgname-r$pkgver"

  #meson test -C "_build"
}

package() {
  cd "$pkgname-r$pkgver"

  meson install -C "_build" --destdir "$pkgdir"
}
