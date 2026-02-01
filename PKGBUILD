# Maintainer: Antoine Gaudreau Simard <antoineg.simard 'at' gmail.com>
# Contributor: Michael Limiero <mike5713 at gmail dot com>
pkgname=zmkbatx
pkgver=1.0.1
pkgrel=4
pkgdesc="Tool for peripheral battery monitoring for ZMK split keyboards over BLE"
arch=("x86_64")
url="https://github.com/mh4x0f/zmkBATx"
license=('MIT')
depends=("simplebluez" "qt6-base" "qt6-connectivity" "dbus")
source=("https://github.com/mh4x0f/zmkBATx/archive/refs/tags/v${pkgver}.tar.gz"
	"zmkbatx-1.0.1-combined.patch")
sha256sums=('33a2f2cbb63cae1159240bf57e8a30666b432fc831d0dcc439f71022ce658a01'
            '5a5623de1cd4527826a4b65c8623a584d1a2ce4d6b789f6cfca47c0dd3f4548a')

prepare() {
	cd "zmkBATx-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver-combined.patch"
}

build() {
	cd "zmkBATx-$pkgver"
	qmake6 zmkBATx.pro -spec linux-g++ CONFIG+=qtquickcompiler INCPATH+=' /usr/lib64/dbus-1.0/include' LIBS+='-lsimpledbus ' PREFIX=/usr
	make
}

package() {
	cd "zmkBATx-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
