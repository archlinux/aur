# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-blockchain
pkgver=2.4.0
pkgrel=2
pkgdesc="Bitcoin Blockchain Library"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'icu'
         'libbitcoin'
         'libbitcoin-consensus'
         'libsecp256k1')
makedepends=('autoconf'
             'automake'
             'gcc'
             'libtool'
             'm4'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-blockchain"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('deb4e790107c88908b7b66428161b39336ee7dbbfe0f2a515dda6d6e76d3fb05')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin-blockchain \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-blockchain \
    --localstatedir=/var/lib/libbitcoin-blockchain \
    --with-gnu-ld \
    --without-tests \
    --without-tools
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-blockchain"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
