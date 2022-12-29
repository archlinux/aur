# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hse
pkgver=3.0.0
pkgrel=3
pkgdesc="Heterogeneous-memory storage engine"
arch=('i686' 'x86_64')
url="https://hse-project.github.io/"
license=('apache')
depends=('glibc' 'cjson' 'curl' 'libbsd' 'libmicrohttpd' 'liburcu' 'libyaml' 'lz4' 'mongo-c-driver' 'pmdk' 'xxhash')
makedepends=('cmake' 'meson')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/hse-project/hse/archive/refs/tags/r$pkgver.tar.gz")
sha256sums=('67e4ac82e004e70ad2dd51d8e4ce4a1611a707e0232b3372e4113921e183328a')


build() {
  cd "$pkgname-r$pkgver"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    -Ddefault_library="both" \
    -Dforce_fallback_for="" \
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
