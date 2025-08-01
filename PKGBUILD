#!/bin/bash
# Maintainer: 3bd <3bd3bdr@gmail.com>
# Change minimal OpenGL version from 3.3 to 2.1 (2006)

_pkgname=raylib
pkgname=raylib-oldgl-git
pkgver=5.5
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
sha256sums=('aea98ecf5bc5c5e0b789a76de0083a21a70457050ea4cc2aec7566935f5e258e')

build(){
	cd "$_pkgname-$pkgver/src" || return

	cat <<-EOF
		===========================================================
		If you want support for even earlier versions of OpenGL,
		then change the version in the PKGBUILD file.
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
