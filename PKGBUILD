# Maintainer: Macxcool <macx cool at tutanota dot com>
# Contributor: loqs
pkgname=libloc
pkgver=0.9.16
pkgrel=1
pkgdesc="IPFire Location powers firewall rules in IPFire based on source/destination country as well as geographic reports."
arch=('x86_64')
url="https://location.ipfire.org"
license=('LGPL')
depends=(glibc openssl)
makedepends=(asciidoc perl python intltool systemd)
optdepends=(perl python)
source=("https://source.ipfire.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2092361f0c76b31e65aed85692c56176996925e1cd5d78d113ab9c53ba27f3fc')

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
