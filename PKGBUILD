# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
pkgname=nqp
pkgver=2021.09
pkgrel=1
pkgdesc="Lightweight Raku-like environment for virtual machines (MoarVM backend)"
arch=('x86_64')
url='https://github.com/Raku/nqp'
license=(PerlArtistic)
depends=("moarvm>=$pkgver")
makedepends=('perl>=5.8')
provides=('nqp-moarvm')
replaces=('nqp-moarvm')
conflicts=('nqp-moarvm')
options=('!makeflags')
source=("https://github.com/Raku/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('249e3f94575dced2b992ed0f66914c81820837e5efd2455bfd2d49234c98ec4951ab1c5fefad8191e297f5d11c58da46b95f5b3f9da0294d34960b5af8fc0958')

build() {
	cd "$pkgname-$pkgver"

	perl Configure.pl --backends=moar --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
