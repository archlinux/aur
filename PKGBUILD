pkgname=deadbeef-plugin-vu-meter-git
pkgver=20150510
pkgrel=1
pkgdesc="Retro VU Meter Plugin for the DeaDBeeF audio player (development version)"
url="https://github.com/cboxdoerfer/ddb_vu_meter"
arch=('i686' 'x86_64')
license='GPL2'
depends=('deadbeef')
makedepends=('git' 'pkg-config' 'gtk2' 'gtk3')

_gitname=ddb_vu_meter
_gitroot=https://github.com/cboxdoerfer/${_gitname}

source=(git+$_gitroot
        https://raw.githubusercontent.com/eimiss/arch_vu_meter_patch/master/arch_vu_meter_patch)
md5sums=('SKIP' 'SKIP')


pkgver() {
  cd $_gitname
  printf "r""$(git rev-list --count HEAD)"
}

build() {
  cd $_gitname

  touch AUTHORS
  touch ChangeLog

  patch -p1 vumeter.c < $startdir/arch_vu_meter_patch

  make
}

package() {
  install -D -v -c $srcdir/$_gitname/gtk2/ddb_vis_vu_meter_GTK2.so $pkgdir/usr/lib/deadbeef/ddb_vis_vu_meter_GTK2.so
  install -D -v -c $srcdir/$_gitname/gtk3/ddb_vis_vu_meter_GTK3.so $pkgdir/usr/lib/deadbeef/ddb_vis_vu_meter_GTK3.so
  install -D -v -c $srcdir/$_gitname/vumeter.png $pkgdir/usr/lib/deadbeef/vumeter.png
}

