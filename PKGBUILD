# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-client
pkgver=2.2.0
pkgrel=1
pkgdesc="The Bitcoin Client Protocol Implementation"
arch=('i686' 'x86_64')
makedepends=('autoconf'
             'automake'
             'boost'
             'boost-libs'
             'czmq-git'
             'czmqpp-git'
             'gcc'
             'libbitcoin'
             'libsodium'
             'libtool'
             'make'
             'pkg-config'
             'secp256k1-git'
             'zeromq')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-client"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('a350e55b16af8e53ec46071fe552b0ec1dd95e233005bc4f55adb82a0d85e9bc')

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
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin-client"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
