# Maintainer: Aleksy Grabowski <qrdwibmkg@mozmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
pkgname=nqp
pkgver=2026.04
pkgrel=1
pkgdesc="Lightweight Raku-like environment for virtual machines (MoarVM backend)"
arch=(i686 x86_64 aarch64)
url='https://github.com/Raku/nqp'
license=(Artistic-2.0)
depends=("moarvm>=$pkgver")
makedepends=('perl>=5.10')
options=('!makeflags')
validpgpkeys=(
    2832BDB33241A14EFCCA61470F09888FE017A4C2
)
source=(
    "https://github.com/Raku/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
    "https://github.com/Raku/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc"
)
sha256sums=(
    f3ba05cb0b99848ff19994485dc6d57c47659a3a57637a169477eae6beb9737d
    983b7e86b87a346a394589adbf93fffa4428ef15c94980f4b98ac4d3b8a16be1
)

build() {
	cd "$pkgname-$pkgver"

	perl Configure.pl --backends=moar --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
