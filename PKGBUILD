
# Maintainer: guarapicci <gigabyz20@gmail.com>
pkgname="mpv-omniglass-git"
pkgver=0.2
pkgrel=2
epoch=
pkgdesc="touchpad gestures for mpv using omniglass backend"
arch=('x86_64')
url="https://github.com/guarapicci/mpv-omniGlass"
license=('GPL-3.0-only')
groups=()
depends=("glibc"
	"omniglass-git"
	"mpv")
makedepends=("git"
	"gcc"
	"mpv")
checkdepends=()
optdepends=()
provides=("mpv-omniglass")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
# 	git clone $url.git "$pkgname-$pkgver"
	cd "$srcdir"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
	#use the build/install scripts included in the repository itself
}

build() {
	cd "${srcdir}/mpv-omniGlass"

	gcc -o omniglass.so mpv-omniGlass.c -shared -fPIC -lomniglass_linux
	
}

check() {
	cd "$srcdir"
	#make -k check
}

package() {
	cd "$srcdir/mpv-omniGlass"
	mkdir -p "${pkgdir}/usr/lib/mpv-omniglass/"
	mkdir -p "${pkgdir}/etc/mpv/scripts"
	cp omniglass.so "${pkgdir}/etc/mpv/scripts/"
	cp omniglass.so "${pkgdir}/usr/lib/mpv-omniglass/"
}
