# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-explorer
pkgver=2.1.0
pkgrel=1
pkgdesc="The Bitcoin Command Line Tool"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'czmq-git'
         'czmqpp-git'
         'libbitcoin-client'
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
url="https://github.com/libbitcoin/libbitcoin-explorer"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('c87b5c48720b78d93c2e2af3e2a9213a0d299ff4798beaa00ca23c062bfa9c92')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin-explorer \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-explorer \
    --localstatedir=/var/lib/libbitcoin-explorer \
    --with-bash-completiondir=/usr/share/bash-completion/completions \
    --with-gnu-ld \
    --without-tests
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/libbitcoin-explorer/COPYING"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
