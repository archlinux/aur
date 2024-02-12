#!/bin/bash
# Maintainer: Jumps Are Op <jumpsareop@gmail.com>
# Change minimal OpenGL version from 3.3 to 2.1 (2006)

_pkgname=raylib
pkgname=raylib-oldgl-git
pkgver=5.0
pkgrel=0
pkgdesc='Simple and easy-to-use game programming library (for old GPUs with 2.1 OpenGL or later)'
arch=('armv7a' 'aarch64' 'i686' 'x86_64')
url='http://github.com/raysan5/raylib'
license=('zlib')
depends=()
optdepends=()
provides=(raylib)
conflicts=(raylib)
source=("$pkgname-$pkgver.tar.gz::http://github.com/raysan5/raylib/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('98f049b9ea2a9c40a14e4e543eeea1a7ec3090ebdcd329c4ca2cf98bc9793482')

build(){
	cd "$_pkgname-$pkgver/src" || return

	cat <<-EOF
		========================================================
		If you want support for even earlier versions of OpenGL,
		edit the PKGBUILD file in the package.
		========================================================
	EOF

	# Change 21 to the version you want.
	make GRAPHICS=GRAPHICS_API_OPENGL_21 RAYLIB_LIBTYPE=SHARED
	make GRAPHICS=GRAPHICS_API_OPENGL_21 RAYLIB_LIBTYPE=STATIC
}

package(){
	cd "$_pkgname-$pkgver/src" || return

	make DESTDIR="$pkgdir/usr/" install
}
