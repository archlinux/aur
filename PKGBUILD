# Maintainer: Wiktor W. <wykwit@disroot.org>
# Contributor: Steven Allen <steven@stebalien.com>

pkgname=pbc
pkgver=1.0.0
pkgrel=1
pkgdesc='The pairing-based cryptography library'
arch=('x86_64' 'i686')
url='https://crypto.stanford.edu/pbc/'
license=('LGPL-3.0-or-later')
depends=('gmp')
makedepends=('autoconf-archive')
provides=('libpbc.so')
source=("$url/files/$pkgname-$pkgver.tar.gz")
sha256sums=('18275a367283077bafe35f443200499e3b19c4a3754953da2a1b2f0d6b5922dc')

build() {
  cd "$pkgname-$pkgver"

  sed -i "s/(yywrap)/([noyywrap])/" configure.ac
  ./setup
  ./configure --prefix=/usr --enable-optimized
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

