# Maintainer: VCalV
pkgname=qlipmon
pkgver=1.0.0
pkgrel=1
pkgdesc="clipboard manager with rofi plugin and dbus interface"
arch=('x86_64')
url="https://github.com/vcalv/qlipmon"
license=('GPL3')
groups=()
depends=(qt5-base)
makedepends=()
checkdepends=()
optdepends=('rofi: for rofi integration')
provides=(qlipmon)
conflicts=(qlipmon-git)
replaces=()
backup=()
options=()
install="$pkgname".install
changelog=
source=("https://github.com/vcalv/qlipmon/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
sha512sums=(944dae7605510ab81db63b526f18227d995638c52185a0a07ef19eb834a598140ed8b58ae8eaab64246675a482ee7183b76658aa1655abeb3822b279f07948f4)
validpgpkeys=()

prepare() {
	if [[ ! -d build ]]; then
		mkdir "build"
	fi
	cd "build"
	qmake -o Makefile ../"$pkgname-$pkgver"/QlipMon.pro -spec linux-g++ CONFIG+=release
}

build() {
	cd "build"
	make
}


package() {
	cd "build"
	make install INSTALL_ROOT="$pkgdir/"
}
