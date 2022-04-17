# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=5.2.4
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
  'c1067655539bc01d2b5ec8bf81f7ec918afeca981b8b576582ee1f3e89ee9e1679706aad8bcbf3708f2f57db4e403294a903f380e15719adbc75c4cc49d02b6f'
  'c1437f7bc1e84ab1f1b5a57c23a477a4807844714ac412359cfa34b49c5d8e34f6c68d4b0f7538b7450c233831fd1c9da9af8995cead52cc0b1342a8f374a9d6'
)
sha256sums=(
  'c4bfcd006898179773908a62d4f53ba44a4565161fef88c92d50f684f98a3246'
  'da7d9d7e43c7b114d66c95d02f6ed53d4738e5c7dfd478863f88938ffab1c603'
)
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
CFLAGS="$CFLAGS -flto -O3"

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
