# Maintainer: Aleksy Grabowski <qrdwibmkg@mozmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2026.05
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
    b89c9c6b2eea0d969752d388b264cbb9391cdf5e16d6342a236c01536896ad85f9484a2eb3e2e847f645757065cd56795d329729c469e1f201fb0756dd672aa3
    5d8aa787e7e3cbdc18d65870ce2164d5308127ebaf5a57ed3030668d6819c399fdbf2bca9f9cddae11dc5188807c66be0221d03d03273609d3b3cde83aff5091
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
