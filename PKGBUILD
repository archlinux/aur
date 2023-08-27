# Maintainer: Macxcool <macx cool at tutanota dot com>
# Contributor: loqs
pkgname=libloc
pkgver=0.9.17
pkgrel=1
pkgdesc="IPFire Location powers firewall rules in IPFire based on source/destination country as well as geographic reports."
arch=('x86_64')
url="https://location.ipfire.org"
license=('LGPL')
depends=(glibc openssl)
makedepends=(asciidoc perl python intltool systemd)
optdepends=(perl python)
source=("https://source.ipfire.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('87f28415c0656351b27bc564cda1dd0ed7cb1dc3fd406492d2b6ad9a2cf1733c')

prepare() {
	cd "$pkgname-$pkgver"
	intltoolize -f
	autoreconf -fi
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --localstatedir=/var
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
