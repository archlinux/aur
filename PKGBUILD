# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=lemon-lime-git
pkgver=v.0.1.0120
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
conflicts=("lemon-lime")
replaces=()
backup=()
options=()
install=
changelog=
source=('Project_LemonLime::git+https://github.com/iotang/Project_LemonLime.git'
		"lemon-lime.desktop"
		)
noextract=()
md5sums=('SKIP'
		'168d064b2c784975c30b30c27ba18062'
		)
validpgpkeys=()

pkgver() {
	cd "$srcdir/Project_LemonLime"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/Project_LemonLime"

}

build() {
	cd "$srcdir/Project_LemonLime"
	#./configure --prefix=/usr
	g++ watcher_unix.cpp -o watcher_unix -O2
	qmake lemon.pro
	make

}

check() {
	cd "$srcdir/Project_LemonLime"
	make -k check
}

package() {
	cd "$srcdir/Project_LemonLime"
	install -D -m755 lemon "$pkgdir/usr/bin/$pkgname"
	
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 pics/icon.png "$pkgdir/usr/share/pixmaps/lemon-lime.png"
	install -D -m644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	#install -D -m644 Changelog.md "$pkgdir/usr/share/doc/$pkgname/Changelog.md"
}
