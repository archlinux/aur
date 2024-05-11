#!/bin/bash
# Maintainer: Jumps Are Op <jumpsareop@gmail.com>
# Change minimal OpenGL version from 3.3 to 2.1 (2006)

_pkgname=raylib
pkgname=raylib-oldgl-git
pkgver=5.0
pkgrel=1
pkgdesc='Simple and easy-to-use game programming library (OpenGL 2.1)'
arch=('armv7a' 'aarch64' 'i686' 'x86_64')
url='http://github.com/raysan5/raylib'
license=('zlib')
depends=()
makedepends=(libx11 libxcursor libxinerama libxrandr vulkan-headers xorg-server-devel xorg-xinput)
optdepends=()
provides=(raylib)
conflicts=(raylib)
source=("$pkgname-$pkgver.tar.gz::http://github.com/raysan5/raylib/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('98f049b9ea2a9c40a14e4e543eeea1a7ec3090ebdcd329c4ca2cf98bc9793482')

build(){
	cd "$_pkgname-$pkgver/src" || return

	cat <<-EOF
		===========================================================
		If you want support for an even earlier versions of OpenGL,
		change the version in the PKGBUILD file.
		===========================================================
	EOF

	# Change 21 to the version you want.
	for t in SHARED STATIC;do
		make GRAPHICS=GRAPHICS_API_OPENGL_21 RAYLIB_LIBTYPE="$t"
	done
}

package(){
	cd "$_pkgname-$pkgver/src" || return

	make DESTDIR="$pkgdir/usr/" RAYLIB_LIBTYPE=STATIC install
	cp -- *.so* "$pkgdir/usr/lib"
}
