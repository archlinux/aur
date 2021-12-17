# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hse
pkgver=2.1.0
pkgrel=1
pkgdesc="Heterogeneous-memory storage engine"
arch=('i686' 'x86_64')
url="https://hse-project.github.io/"
license=('apache')
depends=('glibc' 'cjson' 'curl' 'libbsd' 'libmicrohttpd' 'liburcu' 'libyaml' 'lz4' 'mongo-c-driver' 'pmdk' 'xxhash')
makedepends=('git' 'meson')
source=("git+https://github.com/hse-project/hse.git#tag=r$pkgver")
sha256sums=('SKIP')


build() {
  cd "hse"

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    -Dforce_fallback_for="cjson,xxhash" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "hse"

  #meson test -C "_build"
}

package() {
  cd "hse"

  DESTDIR="$pkgdir" meson install -C "_build"
}
