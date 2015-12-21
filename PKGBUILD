# Maintainer: Chris Simpson <csimpson.aur at gmail dot com>
# Contributor: Modeler <dantootill at gmail dot com>

pkgname=libretro-picodrive-git
pkgver=940.8eaad80
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
         '0561a0d90057cf46d52c7bd9a69f771b')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  make -f Makefile.libretro
}

package()
{
  install -Dm644 "$srcdir/$_gitname/picodrive_libretro.so" "$pkgdir/usr/lib/libretro/libretro-picodrive.so"
  install -Dm644 "picodrive_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-picodrive.info"
}
