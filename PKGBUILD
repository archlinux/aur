# Maintainer: Aleksy Grabowski <qrdwibmkg@mozmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
pkgname=nqp
pkgver=2026.11
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
    a40d60b0062925e6e09d4fed219dafb2b9d23df22052a445a61790aa0bdbaad5
    0d41ac502ef036531aebdaa513a9beb1fb2e7e0bcfc12d9d5f23614bc40dd03e
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
