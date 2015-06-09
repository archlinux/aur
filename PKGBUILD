# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-client
pkgver=2.1.0
pkgrel=1
pkgdesc="The Bitcoin Client Protocol Implementation"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'czmq-git'
         'czmqpp-git'
         'libsodium'
         'secp256k1-git'
         'zeromq')
makedepends=('autoconf'
             'automake'
             'gcc'
             'libtool'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-client"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('49d776b9c4c7d0b9978f91bd01ea305c5ac1d5eb881cb17a126056ee1e54fe7f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin-client \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-client \
    --localstatedir=/var/lib/libbitcoin-client \
    --with-gnu-ld \
    --without-tests
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/libbitcoin-client/COPYING"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
