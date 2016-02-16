# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=dilay
pkgver=1.4.0
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

sha1sums=('3eef34fcb3b76336d428bc37cfe66b592ad01776')
