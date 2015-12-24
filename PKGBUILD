# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-blockchain
pkgver=2.2.0
pkgrel=2
pkgdesc="Bitcoin Blockchain Implementation"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'libbitcoin'
         'libbitcoin-consensus'
         'secp256k1-git')
makedepends=('autoconf'
             'automake'
             'gcc'
             'libtool'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-blockchain"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('78bb395c0233ff0210cc13b9601985c98b2d0210e65617b11e1f2b786381af41')

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
