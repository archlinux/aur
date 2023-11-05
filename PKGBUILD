# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2023.10
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
b2sums=('158967b4af119854bc7c1fd9b95a2320727b3f2b4586ebbe30bc3ebc1c49ed412b2abcad24b30aeb54739d2944a13b9f905eadc34304b9aba024a95b2bf843ee')

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
