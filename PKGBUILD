# Maintainer: Chris Simpson <csimpson.aur at gmail dot com>

pkgname=libretro-mednafen-wswan-git
pkgver=583.b850831
pkgrel=1
pkgdesc="libretro implementation of Mednafen PCE FAST (NEC PC Engine)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/beetle-wswan-libretro"
license=('GPL')
depends=(gcc-libs)
makedepends=()

source=("git+https://github.com/libretro/beetle-wswan-libretro.git"
        
"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/mednafen_wswan_libretro.info")
md5sums=('SKIP'
         '360ac68006d7d244658f48ef4ea25921')

_gitname=beetle-wswan-libretro

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
  install -Dm644 "$srcdir/$_gitname/mednafen_wswan_libretro.so" "$pkgdir/usr/lib/libretro/mednafen_wswan_libretro.so"
  install -Dm644 "mednafen_wswan_libretro.info" "${pkgdir}/usr/lib/libretro/mednafen_wswan_libretro.info"
}
