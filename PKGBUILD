# Maintainer:  Mike Polvere <mic.tjs@gmail.com>

pkgname=libretro-parallel-n64-git

_gitname=parallel-n64
_libname=parallel_n64_libretro

pkgver=4975.ab155da1
pkgrel=1
pkgdesc="libretro implementation to Nintendo 64 e 64DD"
arch=('i686' 'x86_64')
url="https://github.com/libretro/parallel-n64"
license=('GPL2')
groups=('libretro')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git")
depends=('libglvnd')
makedepends=('git')
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${_gitname}"
	if [ $CARCH == "i686" ];then
		make WITH_DYNAREC=x86
	else
		make WITH_DYNAREC=$CARCH
	fi
}

package() {
	install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
	msg2 "\e[05;1;35mParallel-n64 requires 64DD IPL ROM BIOS file '64DD_IPL.bin' to be placed in the libretro 'system' folder. \e[0m"
}

