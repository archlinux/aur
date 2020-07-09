# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=rog-core
pkgbase=rog-core
pkgver=0.15.0
pkgrel=1
epoch=
pkgdesc="A utility for Linux to control many aspects (eventually) of the ASUS ROG laptops like the Zephyrus GX502GW"
arch=('x86_64')
url="https://github.com/flukejones/rog-core"
license=('MPL2')
groups=()
depends=(dbus libusb)
makedepends=(rust clang)
checkdepends=()
optdepends=()
conflicts=()
backup=()
options=()
install=
changelog=

source=("https://github.com/flukejones/rog-core/archive/v$pkgver.tar.gz"
        "install-dir.patch")
sha256sums=('4150e7d996a3247a8326aace4b4e88baab74e73ef4fba1c4e535b0a7863d75db' '05222bde8ed64f96047f5d7c11a0bbd852ac8e518ddccb0e0cc9c83e661c173a')
noextract=()
validpgpkeys=()

prepare()
{
	patch -d "$srcdir" -p1 < install-dir.patch
}

build() {
	cd "$srcdir"/$pkgname-$pkgver
	make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	DESTDIR="$pkgdir"/ make install
}
