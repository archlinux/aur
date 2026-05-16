# Maintainer: R <rqou@berkeley.edu>

pkgname=pgsodium
pkgver=3.1.9
pkgrel=1
pkgdesc='libsodium bindings in PostgreSQL'
arch=(x86_64 armv5h armv6h armv7h aarch64)
license=(PostgreSQL BSD-2-Clause MIT)
url=https://github.com/michelp/pgsodium/
depends=(postgresql-libs libsodium)
makedepends=(postgresql clang llvm)
source=("$pkgname-$pkgver.tar.gz::https://github.com/michelp/pgsodium/archive/v${pkgver}.tar.gz")
sha512sums=('dacd36a754b6aef23709c4142d3936af3feb0f18ad9f1b32717d43a1f8c2638f8d732fc924e4c6cff8381560bc6cd58e4ee3777ae55e241b35b5c57fb47d5afc')

build()
{
	cd $srcdir/$pkgname-$pkgver
	# Disable forced -O0
	make PG_CPPFLAGS=
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
