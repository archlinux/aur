# Maintainer: Chris Simpson <csimpson.aur at gmail dot com>

pkgname=libretro-mednafen-ngp-git
pkgver=714.f18354e
pkgrel=1
pkgdesc="libretro implementation of Mednafen NeoPop (Neo Geo Pocket/Color)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/beetle-ngp-libretro"
license=('GPL')
depends=(gcc-libs)
makedepends=()

source=("git+https://github.com/libretro/beetle-ngp-libretro.git"       
	"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/mednafen_ngp_libretro.info")
md5sums=('SKIP'
         '2f3855c9e9cf9fa063a508b846421898')

_gitname=beetle-ngp-libretro

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
  install -Dm644 "$srcdir/$_gitname/mednafen_ngp_libretro.so" "$pkgdir/usr/lib/libretro/mednafen_ngp_libretro.so"
  install -Dm644 "mednafen_ngp_libretro.info" "${pkgdir}/usr/lib/libretro/mednafen_ngp_libretro.info"
}
