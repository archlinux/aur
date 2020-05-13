# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=dosh
pkgver=3
pkgrel=3
pkgdesc='Docker shell'
arch=('any')
url="https://github.com/gportay/$pkgname"
license=('MIT')
depends=('docker')
makedepends=('asciidoctor')
checkdepends=('shellcheck')
source=("https://github.com/gportay/$pkgname/archive/$pkgver.tar.gz"
        '0001-Fix-Use-the-content-of-docker-variables-in-an-array.patch')
sha256sums=('3669ed476311b12b29f87f955e22d2c048f162719b886091d3685d04044733e0'
            '573b7582a174fe0b9e7bfbc29df0e0dce05a7ae1335187af57f9896e34ce247f')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/0001-Fix-Use-the-content-of-docker-variables-in-an-array.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make doc SHELL="/bin/sh"
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install install-doc install-bash-completion
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
