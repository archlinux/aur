# Maintainer: Aleksy Grabowski <qrdwibmkg@mozmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2026.04
pkgrel=1
pkgdesc="Raku compiler for MoarVM"
arch=(i686 x86_64 aarch64)
url='http://rakudo.org/'
license=('Artistic-2.0')
groups=('perl6')
depends=("nqp>=$pkgver")
makedepends=('perl>=5.10')
provides=('perl6')
options=('!makeflags')
validpgpkeys=(
    2832BDB33241A14EFCCA61470F09888FE017A4C2
)
source=(
    "https://rakudo.org/dl/$pkgname/$pkgname-$pkgver.tar.gz"
    "https://rakudo.org/dl/$pkgname/$pkgname-$pkgver.tar.gz.asc"
)
sha512sums=(
    3219482c860c96ed2af4ec57f83410accc9c3e3923b3dd26647447b68440b15f359f4bba57c78b61fe63070301f82f9d4c57d36b77dc0769ac8609fd2ac39bb4
    3f4aea4d8c1c77255a5329e1065327228a597eaa6ec2cc8d6c60ecd75c79e8912214c036e2a15597740f4ee72e0917fc356300fc64058fec5e8eff00ae9c838d
)

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
