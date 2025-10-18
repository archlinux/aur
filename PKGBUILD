# Maintainer: VCalV
pkgname=qlipmon
pkgver=2.2.0
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
sha512sums=('ba4c3d725029ed6f6fe5b1c81356d35252aab89d0e25e6fc31d1e33f32eb3eb0aebedb94270b62de990205fde4f7c67bf8753936da58eddad6ca15fcb066d864')
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
