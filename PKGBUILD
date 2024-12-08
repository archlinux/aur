# Maintainer: Aleksy Grabowski <hurufu@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2024.10
pkgrel=1
pkgdesc="Raku compiler for MoarVM"
arch=(i686 x86_64 aarch64)
url='http://rakudo.org/'
license=(PerlArtistic)
groups=('perl6')
depends=("nqp>=$pkgver")
makedepends=('perl>=5.8')
provides=('perl6')
options=('!makeflags')
source=("https://rakudo.org/dl/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=(26f77510f1d653d5dd8f65dec62642898faa73ea2b7105b13c984a76a50db5c42d659f5466f2626ce74378180cac34cd7529fdb8b01d839785e9e8305cf1fb32)

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
