# Maintainer: VCalV
pkgname=qlipmon
pkgver=2.1.0
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
sha512sums=('6ca32fe12532433bbe38ea9d59767915ad468b68398871739e36de861b760bd77509f3911c8c529b2062644170be6ed46b8dff8e114f08134c2f371075a66fe1')
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
