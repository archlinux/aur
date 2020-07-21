# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=rog-core
pkgbase=rog-core
pkgver=0.15.2
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
sha256sums=('0ba9a3379fd03d3c4a690d31815770215e3523966010ebf25363464186ed29ff' '78ec239b5255d1d6dd4e7ef67d61eab58f79b4d03a27de648c790f6077ad0e46')
noextract=()
validpgpkeys=()

prepare()
{
	patch -d "$srcdir"/$pkgname-$pkgver -p1 < install-dir.patch
}

build() {
	cd "$srcdir"/$pkgname-$pkgver
	make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	DESTDIR="$pkgdir"/ make install
}
