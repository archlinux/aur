# Maintainer: Aleksy Grabowski <qrdwibmkg@mozmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
pkgname=nqp
pkgver=2026.05
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
    f43085635bcda97c6e4163e827bcca34e46840f72316126246b94bc04ab58ebf
    1421735b26387df8fe9d35dc055e566f86cf07341684a6eb31063c15b73525fc
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
