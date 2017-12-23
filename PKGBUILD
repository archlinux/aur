# $Id$
# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgbase=libretro-beetle-psx-git
pkgname=('libretro-beetle-psx-git' 'libretro-beetle-psx-hw-git')
pkgver=1845.a28b1bb
pkgrel=1
pkgdesc='Sony PlayStation core'
arch=('x86_64' 'i686')
url='https://github.com/libretro/beetle-psx-libretro'
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git' 'libgl' 'mesa' 'vulkan-icd-loader')
source=("libretro-beetle-psx::git+https://github.com/libretro/beetle-psx-libretro.git")
sha256sums=('SKIP')
replaces=('libretro-mednafen-psx-git' 'libretro-mednafen-psx-hw-git')
conflicts=('libretro-mednafen-psx-git' 'libretro-mednafen-psx-hw-git')

pkgver() {
	cd libretro-beetle-psx
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd libretro-beetle-psx
	make
	make HAVE_HW=1
}

package_libretro-beetle-psx-git()
{
	conflicts=('libretro-beetle-psx')
	provides=('libretro-beetle-psx')
	
	cd libretro-beetle-psx
	install -Dm 644 mednafen_psx_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

package_libretro-beetle-psx-hw-git()
{
	conflicts=('libretro-beetle-psx-hw')
	provides=('libretro-beetle-psx-hw')
	depends+=('libgl')
	
	cd libretro-beetle-psx
	install -Dm 644 mednafen_psx_hw_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}
