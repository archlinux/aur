# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Harvie
# Contributor: realitygaps

pkgname=autozen
pkgver=2.1
pkgrel=6
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
            'bb0342feff24fa29cc78c097c7387a31d8b64edc09a246e503a9f720421f5aa8'
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
