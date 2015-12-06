# Maintainer: Chris Simpson <csimpson.aur at gmail dot com>

pkgname=libretro-mednafen-pce-fast-git
pkgver=643.6e2eaf7
pkgrel=1
pkgdesc="libretro implementation of Mednafen PCE FAST (NEC PC Engine)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/beetle-pce-fast-libretro"
license=('GPL')
depends=(gcc-libs)
makedepends=()

source=("git+https://github.com/libretro/beetle-pce-fast-libretro.git"
        
"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/mednafen_pce_fast_libretro.info")
md5sums=('SKIP'
         '768c5e6c44157617ed641978d0547eec')

_gitname=beetle-pce-fast-libretro

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
  install -Dm644 "$srcdir/$_gitname/mednafen_pce_fast_libretro.so" "$pkgdir/usr/lib/libretro/mednafen_pce_fast_libretro.so"
  install -Dm644 "mednafen_pce_fast_libretro.info" "${pkgdir}/usr/lib/libretro/mednafen_pce_fast_libretro.info"
}
