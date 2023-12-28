# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Tobias Markus < tobias AT miglix DOT eu >

pkgname=libacars
pkgver=2.2.0
pkgrel=1
pkgdesc="A library for decoding various ACARS message payloads"
arch=('x86_64')
url="https://github.com/szpajder/libacars"
license=('MIT')
depends=('zlib' 'libxml2' 'jansson' 'glibc')
makedepends=('cmake')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/szpajder/libacars/archive/v$pkgver.tar.gz")
sha256sums=('495e9836c8a1033a5d7814e68ebfc3b0d8f7db1747d13310e7df47c561aee9ce')

build() {
  cd "$srcdir"

  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build \
      -S "$pkgname-$pkgver" \
      -Wno-dev \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=None
  make -C build
}

package() {
  cd "$srcdir"

  make -C build install DESTDIR="$pkgdir"

  install -Dm644 "$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2:sw=2:expandtab
