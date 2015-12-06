# Maintainer: Chris Simpson <csimpson.aur at gmail dot com>

pkgname=libretro-vecx-git
pkgver=47.be67ef1
pkgrel=1
pkgdesc="libretro implementation of vecx (Vectrex)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-vecx"
license=('GPL')
depends=(glibc)
makedepends=()

source=("git+https://github.com/libretro/libretro-vecx.git"
        
"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/vecx_libretro.info")
md5sums=('SKIP'
         'a482d3e6b0ac0d9e6533f7719ebdb416')

_gitname=libretro-vecx;

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
  install -Dm644 "$srcdir/$_gitname/vecx_libretro.so" "$pkgdir/usr/lib/libretro/vecx_libretro.so"
  install -Dm644 "vecx_libretro.info" "${pkgdir}/usr/lib/libretro/vecx_libretro.info"
}
