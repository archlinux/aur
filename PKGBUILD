# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=5.2.2
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
  '6f3f3809867ea09ad076a6daea9c4da75f7fddf9f4965cbd2b7057722db6ea5f5534b7967ea04de365a79281cf9a70ae87a8529435866fec9bd74613d8cc5c32'
  'c3e3b0486c7904cc5ad5efc970fb87ddfe0b6e36ccd6dacff412859a213fc4df91a4c5a46be3273b664b3f8b0e89d66abf10691d167ed9e91c7f0c4e0cfbad7d'
)
sha256sums=(
  '480249fc0e6a54cb2dc0059734ce433bff344d27b40b8591ae410068e1573352'
  'f92ad3c6351a0811b86c251d41688f8a2a1c76131bf884e5de0766bb0bfb1d80'
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
