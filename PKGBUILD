# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>
pkgname=dilay
pkgver=1.5.0
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
	install -Dm644 logoBg.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}

sha1sums=('3a70e84d46313c2b348262b06d8b9cb0655f0d93')
