# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=lemon-lime
pkgver=v0.1.3
pkgrel=1
epoch=
pkgdesc="为了 OI 比赛而生的基于 Lemon 的轻量评测系统 | A tiny judging environment for OI contest based on Project_LemonPlus"
arch=(x86_64)
url="https://github.com/iotang/Project_LemonLime"
license=('GPL3')
groups=()
depends=('qt5-base')
makedepends=()
checkdepends=()
optdepends=()
provides=("lemon-lime")
conflicts=("lemon-lime-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/iotang/Project_LemonLime/archive/${pkgver}.tar.gz"
		"lemon-lime.desktop"
		)
noextract=()
md5sums=('e5cc87caad362939ba4930295a42115a'
         '168d064b2c784975c30b30c27ba18062')
validpgpkeys=()

prepare() {
	cd "Project_LemonLime-$pkgver"

}

build() {
	cd "Project_LemonLime-$pkgver"
	#./configure --prefix=/usr
	g++ watcher_unix.cpp -o watcher_unix -O2
	qmake lemon.pro
	make

}

check() {
	cd "Project_LemonLime-$pkgver"
	make -k check
}

package() {
	cd "Project_LemonLime-$pkgver"
	install -D -m755 lemon "$pkgdir/usr/bin/$pkgname"
	
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 pics/icon.png "$pkgdir/usr/share/pixmaps/lemon-lime.png"
	install -D -m644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	#install -D -m644 Changelog.md "$pkgdir/usr/share/doc/$pkgname/Changelog.md"
}
