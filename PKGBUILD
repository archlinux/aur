# Maintainer: Aleksy Grabowski <qrdwibmkg@mozmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2026.11
pkgrel=1
pkgdesc="Raku compiler for MoarVM"
arch=(i686 x86_64 aarch64)
url='http://rakudo.org/'
license=('Artistic-2.0')
groups=('perl6')
depends=("nqp>=$pkgver")
makedepends=('perl>=5.10')
provides=('perl6')
options=('!makeflags')
validpgpkeys=(
    2832BDB33241A14EFCCA61470F09888FE017A4C2
)
source=(
    "https://rakudo.org/dl/$pkgname/$pkgname-$pkgver.tar.gz"
    "https://rakudo.org/dl/$pkgname/$pkgname-$pkgver.tar.gz.asc"
)
sha512sums=(
    ad4072a2dfd5c03773a8e3e9943c8229009eccd716b94eaffc79652576369028fb5e232755398fd4657ef065b64f9cc1746069c9be8cff721cd9ae7946f585d4
    9a3641ebf9d73c5e3a22d7145c0f7980434b1b1a1dffe00ec070fef416a95ede71ff59d905265dd6e85d70fc6ab865c371a0e17500f88225ba90d8b1d38ecc6f
)

build() {
	cd "$pkgname-$pkgver"
	perl Configure.pl --prefix=/usr --backends=moar
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm755 tools/install-dist.raku "$pkgdir"/usr/bin/perl6-install-dist
}
