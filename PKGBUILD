# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=bcachefs-tools
epoch=2
pkgver=24
pkgrel=1
pkgdesc="bcachefs filesystem utilities"
arch=(x86_64)
url="https://evilpiepirate.org/git/bcachefs-tools.git/"
license=('GPL2')
depends=(liburcu libaio util-linux-libs keyutils zstd libsodium)
checkdepends=(python-pytest)
source=("git+https://evilpiepirate.org/git/bcachefs-tools.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	sed -i -e 's|ROOT_SBINDIR=/sbin|ROOT_SBINDIR=$(PREFIX)/bin|' Makefile
}

build() {
	cd "$pkgname"
	make PREFIX=/usr $MAKEFLAGS
}

package() {
	cd "$pkgname"
	make PREFIX=/usr $MAKEFLAGS DESTDIR="$pkgdir/" install
}
