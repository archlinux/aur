# Maintainer: Popolon < popolon àt popolon.org >

_pkgname=raylib-lua
pkgname=raylua-git
pkgver=r213.d7c7172
pkgrel=1
pkgdesc="A modern LuaJIT binding for raylib"
arch=($CARCH)
url="https://github.com/TSnake41/raylib-lua"
license=('ISC')
depends=('alsa-lib' 'mesa' 'libx11' 'libxrandr' 'libxi' 'xorg-server' 'xorgproto' 'glu' )
provides=("raylua" "raylib-lua")
conflicts=("raylua" "raylib-lua")
source=("git+https://github.com/TSnake41/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init
}

build() {
	cd "${srcdir}/${_pkgname}"
	echo "make luajit"
	make luajit
	echo "make raylib"
	make raylib
	echo "make raylib-lua"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
        for binary in "raylua_e raylua_r raylua_s"
	do
	  install -Dm755 ${binary} -t ${pkgdir}/usr/bin/
	done
	install -Dm644 LICENCE -t ${pkgdir}/usr/share/licenses/${_pkgname}/
}

