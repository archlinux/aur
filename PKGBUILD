# Maintainer: Thomas Girod <tgirod@altu.fr>
pkgname=overwitch
pkgver=2.0
pkgrel=1
epoch=
pkgdesc="JACK client for Overbridge devices"
arch=('x86_64')
url="https://github.com/dagargo/overwitch"
license=('GPL')
groups=()
depends=('libusb' 'jack' 'libsamplerate' 'libsndfile' 'gettext' 'json-glib' 'gtk3')
makedepends=('make' 'autoconf')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/dagargo/overwitch/releases/download/$pkgver/overwitch-$pkgver.tar.gz")
noextract=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	autoreconf --install
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	mkdir -p $pkgdir/usr/lib/udev/rules.d/
	cp udev/*.rules $pkgdir/usr/lib/udev/rules.d/
	mkdir -p $pkgdir/usr/lib/udev/hwdb.d/
	cp udev/*.hwdb $pkgdir/usr/lib/udev/hwdb.d/
}
sha256sums=('eaf3946ece677f8fe1ac5c12e2a66497ecd8982309f49aa01956f561eb8b1196')
