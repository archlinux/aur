# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-consensus
pkgver=1.0.1
pkgrel=1
pkgdesc="Libbitcoin Consensus Library"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'secp256k1-git')
makedepends=('autoconf'
             'automake'
             'gcc'
             'libtool'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-consensus"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('5f04904b59fa9ea6d9a69ef4456f2ddaa0f8ab24f9d303b69a14177c2c7092a2')

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
    --with-secp256k1 \
    --without-openssl \
    --without-tests
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/libbitcoin-consensus/COPYING"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
