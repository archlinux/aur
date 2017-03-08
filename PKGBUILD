# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-consensus
pkgver=3.0.0
pkgrel=1
pkgdesc="Bitcoin Consensus Library"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'libsecp256k1')
makedepends=('autoconf'
             'automake'
             'gcc'
             'libtool'
             'm4'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-consensus"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('acbfe52253367d1f99c825b9d32fb1a24419e50bd02b1b7c588c12616ef5a434')

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
  make -j$(($(nproc)/2))
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-consensus"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
