# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=libretro-picodrive-git
pkgver=r962.8289697
pkgrel=1
pkgdesc="libretro implementation of PicoDrive. (Sega Megadrive/Genesis/Sega Master System/Sega GameGear/Sega CD/32X)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/picodrive"
license=('GPL')
depends=('glibc')
makedepends=('git')

_gitname=picodrive

source=("git+https://github.com/libretro/picodrive.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/picodrive_libretro.info")
md5sums=('SKIP'
         'SKIP')

pkgver() {

  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
  cd "$_gitname"
  git submodule init
	  git submodule update
}

build() {

  cd "$_gitname"
  ./configure  
  make -f Makefile.libretro

}

package()
{

  install -Dm644 "$srcdir/$_gitname/picodrive_libretro.so" "$pkgdir/usr/lib/libretro/picodrive_libretro.so"
  install -Dm644 "picodrive_libretro.info" "${pkgdir}/usr/lib/libretro/picodrive_libretro.info"

}
