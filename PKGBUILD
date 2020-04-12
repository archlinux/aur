# Maintainer: brunorro <br1.rdgz@gmail.com>
_pkgname=wterm
pkgname=$_pkgname-git
pkgver=0ae42717
pkgrel=1
epoch=
pkgdesc="xterm for wayland (simple wayland st suckless terminal)"
arch=('x86_64')
url="https://github.com/majestrate/wterm"
license=('MIT')
groups=()
depends=('libdrm' 'fontconfig' 'wayland' 'libxkbcommon' 'pixman')
makedepends=()
checkdepends=()
optdepends=('ttf-liberation: Red Hats liberation fonts')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+https://github.com/majestrate/wterm")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
	cd "$_pkgname"
	git rev-parse HEAD | cut -b1-8
}

prepare() {
	cd "$_pkgname"
	sed -i "/tic -s wterm.info/d" Makefile 
}

build() {
	cd "$_pkgname"
	make wld
	make wterm
}

package() {
	cd "$_pkgname"
	make BIN_PREFIX="$pkgdir/usr/local" SHARE_PREFIX="$pkgdir/usr/local" install
	mkdir -p "$pkgdir/usr/share/terminfo/w/"
	cp wterm.info "$pkgdir/usr/share/terminfo/w/"
}
