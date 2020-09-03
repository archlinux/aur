# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Contributor: Ward De Ridder <aur[at]warddr.eu>

pkgname=kochmorse
_author=hmatuschek
pkgver=3.5.0
pkgrel=1
pkgdesc="A easy to use Morse Code (Ham Radio) trainer using the Koch-method."
arch=('i686' 'x86_64')
url="https://github.com/$_author/$pkgname"
license=('GPL')
depends=('qt5-multimedia' 'hamradio-menus')
makedepends=('cmake')
optdepends=('hamradio-menus: XDG compliant menuing')
provides=('kochmorse')
conflicts=('kochmorse-py' 'kochmorse-git')
source=($url/archive/v$pkgver.tar.gz)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	msg "Preparing sources..."

	sed -i -e s:'Teaching;':'Application;HamRadio': shared/$pkgname.desktop
	sed -i '$ a X-DCOP-ServiceType=none' shared/$pkgname.desktop
	sed -i '$ a X-KDE-SubstituteUID=false' shared/$pkgname.desktop
}	
build() {
	cd "$srcdir/$pkgname-$pkgver"
	msg "Starting build..."

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE -DPORTAUDIO_INCLUDE_DIRS=/usr/include
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	msg "Starting packaging..."

	make DESTDIR="$pkgdir/" install
}

md5sums=('e85c1b284a36d44702ab2a8b01d53eec')
sha256sums=('4824970196434a227c341078fb99eb7063ba211692426f55f8c4c3e98c759623')
