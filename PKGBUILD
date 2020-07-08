# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=rog-core
pkgbase=rog-core
pkgver=0.14.4
pkgrel=2
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
sha256sums=('8c89934545e82808805a7c1e43dd8c1f69177dbc14769be418bd8074bf18e1f8'
            '05222bde8ed64f96047f5d7c11a0bbd852ac8e518ddccb0e0cc9c83e661c173a')
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

