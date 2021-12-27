# Maintainer: brunorro <br1.rdgz@gmail.com>
_pkgname=wterm
pkgname=$_pkgname-git
pkgver=20210302
pkgrel=1
epoch=1
pkgdesc="xterm for wayland (simple wayland st suckless terminal)"
arch=('x86_64')
url="https://github.com/majestrate/wterm"
license=('MIT')
groups=()
depends=('libdrm' 'fontconfig' 'wayland' 'libxkbcommon' 'pixman' 'git')
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
	git log -1 --format="%cd" --date=short | sed 's|-||g'
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
	make BIN_PREFIX="$pkgdir/usr/" SHARE_PREFIX="$pkgdir/usr/" install
	mkdir -p "$pkgdir/usr/share/terminfo/w/"
	cp wterm.info "$pkgdir/usr/share/terminfo/w/"
}
