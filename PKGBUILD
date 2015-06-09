# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-blockchain
pkgver=2.0.0
pkgrel=1
pkgdesc="Bitcoin Blockchain Implementation"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'libbitcoin'
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
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/$pkgver)
sha256sums=('0dbb16b3d7b2c45a6a9aa9abb72e499f7eb9f1cee18d48f64dd62f105e1f435e')

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
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/libbitcoin-blockchain/COPYING"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
