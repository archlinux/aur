# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Harvie
# Contributor: realitygaps

pkgname=autozen
pkgver=2.1
pkgrel=5
pkgdesc="A binaural brainwave generator"
arch=('x86_64' 'i686')
url="http://linuxlabs.com/autozen.html"
license=('GPL')
depends=('gtk' 'perl')
changelog=CHANGES
source=("$pkgname-$pkgver.tar.gz::http://linuxlabs.com/download/$pkgname-$pkgver.tar.gz"
        '001-Makefile.patch'
        "$pkgname.desktop")
sha256sums=('e7677d8b192999d02c5e25354e0546f08a933d594b79f55bfec199de947a1301'
            '3b48ef8e274eac0c54667d6cd009a96091dc9be842de0e1c7013194b69ff03f1'
            'd478fb8586387ac32555ce839e56e7eae6ff0ce4d7b3a62e9cac246d8076482f')

prepare() {
	patch -p1 -d "$pkgname-$pkgver" Makefile < 001-Makefile.patch
}

build() {
	cd "$pkgname-$pkgver"
	make clean
	make PREFIX=/usr
}

package() {
	install -Dm 644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
