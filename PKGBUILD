# Maintainer: Chris Simpson <csimpson.aur at gmail dot com>

pkgname=libretro-fba-git
pkgver=63.03305b9
pkgrel=1
pkgdesc="libretro implementation of Final Burn Alpha (Arcade)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-fba"
license=('GPL')
depends=(gcc-libs)
makedepends=()

source=("git+https://github.com/libretro/libretro-fba.git"
        "https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/fba_libretro.info")
md5sums=('SKIP'
         'bb12e5156b605d846ce74ec4bbdc4907')

_gitname=libretro-fba;

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  make -f makefile.libretro
}

package()
{
  install -Dm644 "$srcdir/$_gitname/fba_libretro.so" "$pkgdir/usr/lib/libretro/fba_libretro.so"
  install -Dm644 "fba_libretro.info" "${pkgdir}/usr/lib/libretro/fba_libretro.info"
}
