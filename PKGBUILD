# Maintainer: Aleksy Grabowski <hurufu@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2024.06
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
b2sums=(c63a066584e16c9e27649d54feff8ca4a6bd766e0cb53dac6c9759f660b8c3906444310aa100ccf1eb683085514ff87a571cd0a51e1407db0561efcf89f5a4b3)

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
