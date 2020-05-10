# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
pkgname=nqp
pkgver=2020.05
pkgrel=1
pkgdesc="High-level environment to create compilers and libraries for virtual machines (MoarVM backend)"
arch=('any')
url='https://github.com/Raku/nqp#readme'
license=(PerlArtistic)
depends=('bash' "moarvm>=$pkgver")
makedepends=('perl>=5.8')
provides=('nqp-moarvm')
replaces=('nqp-moarvm')
conflicts=('nqp-moarvm')
options=('!makeflags')
source=("https://github.com/Raku/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('d73bb5cf5dcd2f0e0d42928fb12382428355f3c19bbcd015950c2a9e49ab73c215ce8ce21f3686283866c387823f1cbb3ba8179de8f7a66dca43afae94a45a42')

build() {
	cd "$pkgname-$pkgver"

	perl Configure.pl --backends=moar --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
