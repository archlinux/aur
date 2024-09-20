# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Michael Limiero <mike5713 at gmail dot com>
pkgname=zmkbatx
pkgver=1.0.1
pkgrel=3
epoch=
pkgdesc="Tool for peripheral battery monitoring for ZMK split keyboards over BLE"
arch=("x86_64")
url="https://github.com/mh4x0f/zmkBATx"
license=('MIT')
groups=()
depends=("simplebluez" "qt6-base" "qt6-connectivity" "dbus")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/mh4x0f/zmkBATx/archive/refs/tags/v${pkgver}.tar.gz"
	"zmkbatx-1.0.1.patch")
noextract=()
sha256sums=('33a2f2cbb63cae1159240bf57e8a30666b432fc831d0dcc439f71022ce658a01' 'SKIP')
validpgpkeys=()

prepare() {
	cd "zmkBATx-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "zmkBATx-$pkgver"
	qmake6 zmkBATx.pro -spec linux-g++ CONFIG+=qtquickcompiler INCPATH+=' /usr/lib64/dbus-1.0/include' LIBS+='-lsimpledbus ' PREFIX=/usr
	make
}

# check() {
# 	cd "zmkBATx-$pkgver"
# 	make -k check
# }

package() {
	cd "zmkBATx-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
