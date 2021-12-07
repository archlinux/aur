# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=5.2.1
pkgrel=2
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
  '8f5cfdfc0b2e1866d8fc1477d7bfc2882cf4d2e4844fcf41ded5f8b52b4d8124c073e845d86b355977f815a5a8a2f22fd98495ec4b5dd41737b808a3a4f4bb56'
  'b904b8d946df9e6ff5305540aecaa40ac9cc805243bf0b0844895b87eba1845009b4efdebdb912ddcbc010329df556d7d49390916065e6d7a9043a039ac249f6'
)
sha256sums=(
  'bc031b68e5eafef37305697b76f6261abac4a94286e260fa339771f2484f1ecd'
  '8bce8396497d47ace1dd5a2938ce7bdffa88355fb040e5051782474b0801c950'
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
