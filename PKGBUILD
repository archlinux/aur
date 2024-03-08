# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2024.02
pkgrel=1
pkgdesc="Raku compiler for MoarVM"
arch=('i686' 'x86_64')
url='http://rakudo.org/'
license=(PerlArtistic)
groups=('perl6')
depends=("nqp>=$pkgver")
makedepends=('perl>=5.8')
provides=('perl6')
options=('!makeflags')
source=("https://rakudo.org/dl/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('aa361c9e21c34cc5c737390ab6b1b8828afaa6aafaa604dbde273d68084cd0cebaf9c8bd796a394844f05b7bafc4f5d2db8a80a7bc1be8baab52b7a7f858bfa2')

build() {
	cd "$pkgname-$pkgver"
	perl Configure.pl --prefix=/usr --backends=moar
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm755 tools/install-dist.p6 "$pkgdir"/usr/bin/perl6-install-dist
}
