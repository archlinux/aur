# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=lemon-lime
pkgver=0.2.2
pkgrel=1
epoch=
_commit=bae7c331ca7203a242e4533ba859c0c6016521ba
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
source=("https://github.com/iotang/Project_LemonLime/archive/v${pkgver}.tar.gz"
        "https://github.com/itay-grudev/SingleApplication/archive/$_commit/SingleApplication-$_commit.tar.gz"
		"lemon-lime.desktop"
		)
noextract=()
md5sums=('12904a15e10d9f3fde6730de9f57a298'
         '2a664159199854bf89c6bd1b46b1bfaf'
         '168d064b2c784975c30b30c27ba18062')
validpgpkeys=()

prepare() {
    cp -r SingleApplication-$_commit/* Project_LemonLime-$pkgver/singleapplication

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
	install -D -m644 $srcdir/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	#install -D -m644 Changelog.md "$pkgdir/usr/share/doc/$pkgname/Changelog.md"
}
