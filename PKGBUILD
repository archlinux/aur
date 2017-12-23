# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgbase=libretro-mednafen-psx-git
pkgname=('libretro-mednafen-psx-git' 'libretro-mednafen-psx-hw-git')
_gitname=beetle-psx-libretro
_officialname=mednafen_psx_libretro
_officialnamehw=mednafen_psx_hw_libretro
pkgver=1845.a28b1bb
pkgrel=1
pkgdesc="libretro implementation of Mednafen PSX"
arch=('i686' 'x86_64')
url="https://github.com/libretro/beetle-psx-libretro"
groups=('libretro')
license=('GPLv2')
makedepends=('git')
source=("git://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build()
{
	cd "$_gitname"
	make clean
	make
	cp "$srcdir/$_gitname/${_officialname}.so" "$srcdir"
	make clean
	make HAVE_HW=1
	cp "$srcdir/$_gitname/${_officialnamehw}.so" "$srcdir"
}

package_libretro-mednafen-psx-git()
{
	conflicts=('libretro-mednafen-psx')
	provides=('libretro-mednafen-psx')

	install -v -Dm644 "$srcdir/${_officialname}.so" "$pkgdir/usr/lib/libretro/${_officialname}.so"
}

package_libretro-mednafen-psx-hw-git()
{
	conflicts=('libretro-mednafen-psx-hw')
	provides=('libretro-mednafen-psx-hw')
	depends=('libgl' 'vulkan-driver')

	install -v -Dm644 "$srcdir/${_officialnamehw}.so" "$pkgdir/usr/lib/libretro/${_officialnamehw}.so"
}
