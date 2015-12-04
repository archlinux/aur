# Maintainer: Chris Simpson <csimpson.aur at gmail dot com>

pkgname=libretro-cap32-git
pkgver=70.7036672
pkgrel=1
pkgdesc="libretro implementation of Caprice32 (Amstrad CPC)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-cap32"
license=('GPL')
depends=(zlib)
makedepends=()

source=("git+https://github.com/libretro/libretro-cap32.git"
        
"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/cap32_libretro.info")
md5sums=('SKIP'
         'e9744b792e7b7fffd68f4389b12e35a0')

_gitname=libretro-cap32;

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  make
}

package()
{
  install -Dm644 "$srcdir/$_gitname/cap32_libretro.so" "$pkgdir/usr/lib/libretro/cap32_libretro.so"
  install -Dm644 "cap32_libretro.info" "${pkgdir}/usr/lib/libretro/cap32_libretro.info"
}
