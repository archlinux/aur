# Maintainer: VCalV
pkgname=qlipmon
pkgver=2.0.0
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
sha512sums=(050ca04f14ff78db40da26c6a426bf5cbc210c8030c7363a5feeaad4974204c9d223511879c5e475e07a03c0a4fb341b0db3b74e42f06cd3047c8d1d7afd9c5a)
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
