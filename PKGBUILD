# Maintainer: bitwave < aur [aTtt] oomlu [d0ot] de>
# Contributor: Sapphira Armageddos <shadowkyogre.public@gmail.com>
pkgname=dilay
pkgver=1.8.0
pkgrel=1
pkgdesc="A 3D sculpting application that provides an intuitive workflow using a number of powerful modeling tool"
arch=('i686' 'x86_64')
url="http://abau.org/dilay/index.html"
license=('GPL')
makedepends=('gendesk')
depends=('glm' 'qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/abau/dilay/archive/${pkgver}.tar.gz")

prepare() {
	gendesk -f -n --pkgname "$dilay" --pkgdesc "$pkgdesc"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	qmake-qt5 -r PREFIX="${pkgdir}/usr"
	make release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "unix/icon/48x48/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

sha1sums=('ef62a6221118c20970545a2e0fab510bd671eb2f')
