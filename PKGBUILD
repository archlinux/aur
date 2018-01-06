# Maintainer: Mikaela RJ Szekely <qyriad@gmail.com>
pkgname=wut-git
_pkgname=wut
pkgver=0.1
pkgrel=1
pkgdesc="A Wii U toolchain/SDK for creating RPX/RPL"
arch=("x86_64")
url="https://github.com/decaf-emu/wut"
license=("GPLv2")
depends=("devkitppc")
makedepends=("cmake" "zlib" "git")
provides=("wut")
source=("git+https://github.com/decaf-emu/wut")
md5sums=("SKIP")
options=("!strip" "!buildflags")

prepare()
{
	cd "$srcdir"
	cd "$_pkgname"
	git submodule update --init --recursive
}

build()
{
	export DEVKITPRO=/opt/devkitpro
	export DEVKITPPC=/opt/devkitpro/devkitPPC
	cd "$srcdir/$_pkgname"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ../
	make
}

package()
{
	cd "$srcdir/$_pkgname/build"
	make install
}
