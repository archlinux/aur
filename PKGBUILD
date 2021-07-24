# Maintainer: Tobias Markus < tobias AT miglix DOT eu >

pkgname=libacars
pkgver=2.1.3
pkgrel=1
pkgdesc="A library for decoding various ACARS message payloads"
arch=('x86_64')
url="https://github.com/szpajder/libacars"
license=('MIT')
depends=('zlib' 'libxml2')
makedepends=('cmake' 'git')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/szpajder/libacars/archive/v$pkgver.tar.gz")
sha256sums=('d221629dd750d203e62813dcd55d58c46dce6b9b5e31ff438c661a99ba659ee4')

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
