# Maintainer: Dylan Barker <dthomasbarker@gmail.com>
_pkgname=dwm
pkgname=$_pkgname-dylan-git
pkgver=6.2.r6.8b45601
pkgrel=1
pkgdesc="Dylan's build of dynamic window manager for X"
url="https://github.com/dylantjb/$_pkgname"
arch=('i686' 'x86_64')
license=('MIT')
depends=('freetype2' 'libx11' 'libxft')
optdepends=(
	'libxft-bgra: if dwm crashes when displaying emojis'
	'libxft-bgra-git: if dwm crashes when displaying emojis'
	'dmenu: program launcher'
	'st: terminal emulator')
makedepends=(git)
source=("git+$url")
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
	cd $_pkgname
	echo "$(awk '/^VERSION =/ {print $3}' config.mk)".r"$(git rev-list --count HEAD)"."$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname 
	make PREFIX=/usr X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd $_pkgname
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
