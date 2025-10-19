# Maintainer: VCalV
pkgname=qlipmon
pkgver=2.3.0
pkgrel=1
pkgdesc="clipboard manager with rofi plugin and dbus interface"
arch=('x86_64')
url="https://github.com/vcalv/qlipmon"
license=('GPL-3.0-only')
groups=()
depends=(qt6-base)
makedepends=()
checkdepends=()
optdepends=(
	'rofi: for rofi integration'
	'systemd: automate start'
	'xdotool: for autopaste on select in rofi'
)
provides=(qlipmon=${pkgver})
conflicts=(qlipmon-git)
replaces=()
backup=()
options=()
install="$pkgname".install
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/vcalv/qlipmon/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
sha512sums=('70bb9fb42e40771bb9dd40c89b5877a0f903debad432e92ac15d6bc44c35b89f33d2cc609e79a0e296b68aa01ef51cc5fe820d7c319fd9ffd3ab10141904431a')
validpgpkeys=()

prepare() {
	if [[ ! -d build ]]; then
		mkdir "build"
	fi
	cd "build"
	qmake6 -o Makefile ../"$pkgname-$pkgver"/QlipMon.pro -spec linux-g++ CONFIG+=release
}

build() {
	cd "build"
	make
}


package() {
	cd "build"
	make install INSTALL_ROOT="$pkgdir/"
}
