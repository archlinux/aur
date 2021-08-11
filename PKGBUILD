# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Harvie
# Contributor: realitygaps

pkgname=autozen
pkgver=2.1
pkgrel=4
pkgdesc="A binaural brainwave generator"
arch=('x86_64')
url="http://linuxlabs.com/autozen.html"
license=('GPL')
depends=('gtk' 'perl')
changelog=CHANGES
source=("$pkgname-$pkgver.tar.gz::http://linuxlabs.com/download/$pkgname-$pkgver.tar.gz"
        '001-Makefile.patch')
sha256sums=('e7677d8b192999d02c5e25354e0546f08a933d594b79f55bfec199de947a1301'
            '3b48ef8e274eac0c54667d6cd009a96091dc9be842de0e1c7013194b69ff03f1')

prepare() {
	patch -p1 -d "$pkgname-$pkgver" Makefile < 001-Makefile.patch
}

build() {
	cd "$pkgname-$pkgver"
	make clean
	make PREFIX=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
