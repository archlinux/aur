# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin-node
pkgver=2.0.0
pkgrel=1
pkgdesc="Bitcoin Full Node"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'libbitcoin-blockchain'
         'secp256k1-git')
makedepends=('autoconf'
             'automake'
             'gcc'
             'libtool'
             'make'
             'pkg-config')
groups=('libbitcoin')
url="https://github.com/libbitcoin/libbitcoin-node"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/libbitcoin/$pkgname/tar.gz/v$pkgver)
sha256sums=('fe14b04f6caf5ce313e593c9cf324dad2f7e3d81565486bc873accf040baef4d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin-node \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin-node \
    --localstatedir=/var/lib/libbitcoin-node \
    --with-bash-completiondir=/usr/share/bash-completion/completions \
    --with-gnu-ld \
    --without-tests
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/libbitcoin-node/COPYING"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
