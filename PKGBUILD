# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-explorer
pkgver=2.2.0
pkgrel=1
pkgdesc="The Bitcoin Command Line Tool"
arch=('i686' 'x86_64')
makedepends=('autoconf'
             'automake'
             'boost'
             'boost-libs'
             'czmq-git'
             'czmqpp-git'
             'gcc'
             'icu'
             'libbitcoin'
             'libbitcoin-client'
             'libsodium'
             'libtool'
             'make'
             'pkg-config'
             'secp256k1-git'
             'zeromq')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-explorer"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('77bb3597ceb384447fc37256004018949682d1e41dccefdaf560f67cf81e2200')

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
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-explorer"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
