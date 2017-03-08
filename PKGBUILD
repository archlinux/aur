# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-protocol
pkgver=3.0.0
pkgrel=1
pkgdesc="Bitcoin Blockchain Query Protocol"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'libbitcoin-system'
         'libsecp256k1'
         'protobuf'
         'zeromq')
makedepends=('autoconf'
             'automake'
             'gcc'
             'libtool'
             'm4'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-protocol"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('545656a0fe3b5a43fbc94ad099fd573c0fa4f6d8604e5895b4b0f9f2c3d38a0e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin-protocol \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-protocol \
    --localstatedir=/var/lib/libbitcoin-protocol \
    --without-examples \
    --without-tests \
    --with-gnu-ld
  make -j$(($(nproc)/2))
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-protocol"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
