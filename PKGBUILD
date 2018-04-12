# Maintainer: Benjamin Hodgetts <ben@xnode.org>

pkgname=libretro-parallel-n64-ex-git
_gitname=parallel-n64
pkgver=r4930.38e073fa
pkgrel=1
pkgdesc="Nintendo 64 emulator core using Vulkan (originally based on Mupen64Plus)"
arch=('i686' 'x86_64')
url="https://github.com/libretro/parallel-n64"
license=('custom' 'GPL' 'LGPL')
makedepends=('git' 'vulkan-headers')
depends=('libglvnd' 'vulkan-icd-loader' 'clang' 'libretro-core-info')
groups=('libretro')
provides=('libretro-parallel-n64')
conflicts=('libretro-parallel-n64')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	install -Dm644 "${_gitname}/parallel_n64_libretro.so" "${pkgdir}/usr/lib/libretro/parallel_n64_libretro.so"
}
