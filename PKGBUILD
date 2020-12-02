# Maintainer: Tobias Markus < tobias AT miglix DOT eu >

pkgname=libacars
pkgver=2.1.1
pkgrel=1
pkgdesc="A library for decoding various ACARS message payloads"
arch=('x86_64')
url="https://github.com/szpajder/libacars"
license=('MIT')
depends=('zlib' 'libxml2')
makedepends=('cmake' 'git')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/szpajder/libacars/archive/v$pkgver.tar.gz")
sha256sums=('aa56a628fb879cf27be6d49eb0beb051d14b449924a9b84a4e155de017db165a')

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

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2:sw=2:expandtab
