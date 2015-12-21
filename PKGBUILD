# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-consensus
pkgver=2.0.0
pkgrel=1
pkgdesc="Libbitcoin Consensus Library"
arch=('i686' 'x86_64')
makedepends=('autoconf'
             'automake'
             'boost'
             'boost-libs'
             'gcc'
             'libtool'
             'make'
             'pkg-config'
             'secp256k1-git')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-consensus"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('5044ce4cc6245b1018c37c58fd0a69c303b1ee5c8a06ac0a03bab991a0929e24')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin-consensus \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-consensus \
    --localstatedir=/var/lib/libbitcoin-consensus \
    --with-gnu-ld \
    --without-tests
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-consensus"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
