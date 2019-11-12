# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2019.07.1
pkgrel=1
pkgdesc="Perl6 compiler for MoarVM"
arch=('i686' 'x86_64')
url='http://rakudo.org/'
license=(PerlArtistic)
groups=('perl6')
depends=("nqp>=$pkgver")
makedepends=('perl>=5.8')
provides=('rakudo-moarvm' 'perl6')
replaces=('rakudo-moarvm')
conflicts=('rakudo-moarvm')
options=('!makeflags')
source=("http://rakudo.org/downloads/$pkgname/$pkgname-$pkgver.tar.gz"
        'stale-files.patch')
sha512sums=('aedb26c8145eefb53471cf96a15b04f6759d43c68e11d7942c693ea2122583dd243e9dfe288d6fb11131eb2bd4e9d0c735986e241c5a35ca126dc7f10d6c4a8d'
            '0029f675ff757966024f84259af9d3fd67ccf1b7703356dcad801ab76da92cbb91bdd47e96f4ea4a14ba618cf4cb2f3717ab93bbfc8f40fe8238832b762684f6')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < "$srcdir"/stale-files.patch
}

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
