# Maintainer: Aleksy Grabowski <hurufu@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2026.01
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
b2sums=('410b9fc1edf4cd1c838b6ea1d73dafa67ea09fb8dafd930165155eeb42bc23a55d841ede94f9b3d3e6835fdab064928d93353ebb78502d9229fb5ba9725c84ba')

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
