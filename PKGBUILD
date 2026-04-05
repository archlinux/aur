# Maintainer: F Carpano < gmail-com: daert781 >
# Contributor: tee < teeaur at duck dot com >

pkgname=ultracopier
_pkgname=Ultracopier
pkgver=3.0.2.0
pkgrel=1
pkgdesc="Ultracopier acts as a replacement for files copy dialogs. Main features include: play/pause, speed limitation, on-error resume, error/collision management"
url='https://ultracopier.herman-brule.com'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('qt5-base' 'qt5-multimedia')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tgz::https://github.com/alphaonex86/Ultracopier/archive/$pkgver.tar.gz")
sha256sums=('f4e3e13ae2f761a92649817c354e60e214076a9bd23abca5baca53eb0ebe4401')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	find ./ -name '*.ts' -exec lrelease {} \;
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	qmake ultracopier.pro \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		QMAKE_LFLAGS="${LDFLAGS}"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 "resources/ultracopier.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "resources/ultracopier-128x128.png" "$pkgdir/usr/share/pixmaps/ultracopier.png"
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

