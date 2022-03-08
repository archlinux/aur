# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=5.2.3
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc')
conflicts=('bc')
source=(
  "$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/bc-$pkgver.tar.xz"
  "$pkgname-$pkgver.tar.xz.sig::$url/releases/download/$pkgver/bc-$pkgver.tar.xz.sig"
)
sha512sums=(
  '5c70c1adcdc7f9beaec4e73b4b2c63654b330b8995a620d03cd01583379234182606efba00fc04798ca57d84be72d9b7d4ba1ba8a48497a1add9f9a44ed08b18'
  '943dda9acf91c96aeec8ceb77df8951c3fe089c2bfef9318d6f35b891f61ece261c43243be8d40bd3c34cfb8ec53840d9ff6be752c13760503cf2848f4c4e96a'
)
sha256sums=(
  '0d307472ce3b846adae658a4703d0fff30019fd13b8f119217adf8e1319c9784'
  'fc8811fefc529ec1533fd5eb9e5ce8bfd96d59ff95bba9a2b419087ca66c58e5'
)
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
CFLAGS="-flto -O3 $CFLAGS"

build() {
  cd "bc-$pkgver"

  PREFIX=/usr ./configure.sh -G -sbc.banner -sdc.tty_mode
  make
}

check() {
  cd "bc-$pkgver"

  env LANG=C LC_ALL=C make check
}

package() {
  cd "bc-$pkgver"

  DESTDIR="$pkgdir" make install

  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  for _doc in {NEWS,NOTICE,README}.md; do
    install -Dm0644 "$_doc" "$pkgdir/usr/share/doc/$pkgname/$_doc"
  done
}

# eof
