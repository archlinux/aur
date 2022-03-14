# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Contributor: Ward De Ridder <aur[at]warddr.eu>

pkgname=kochmorse
_author=hmatuschek
pkgver=3.5.1
pkgrel=2
pkgdesc="A easy to use Morse Code (Ham Radio) trainer using the Koch-method."
arch=('i686' 'x86_64')
url="https://github.com/$_author/$pkgname"
license=('GPL')
depends=('qt5-multimedia' 'hamradio-menus')
makedepends=('cmake' 'qt5-tools')
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

md5sums=('1de7be803338d5cbaddb143e76eb7b55')
sha256sums=('b394fe151cc6bbcb2f24ada9cbab08cbbc3e8538a95a00d190884e9428d8a775')
