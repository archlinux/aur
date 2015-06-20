# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=tsc
pkgver=2.0.0b7
_ver=2.0.0-beta7
pkgrel=1
pkgdesc="The Secret Chronicles of Dr. M."
arch=('i686' 'x86_64')
url="http://www.secretchronicles.de/en/"
license=('GPL3')
depends=('sdl_image' 'sdl_ttf' 'sdl_mixer' 'cegui-0.7' 'boost-libs' 'libxml++')
makedepends=('gperf' 'boost' 'ruby' 'doxygen')
validpgpkeys=('B1FE958ED5E8468EAA208F4BF1D8799FBCC8BC4F')
source=("ftp://ftp.secretchronicles.de/releases/TSC-$_ver.tar.xz"{,.sig}
        $pkgname.desktop
        $pkgname.png)
sha256sums=('37d87c8141ff264cb50d87492a20c5ddae0329e9d62ed46d53894612ca0274b4'
            'SKIP'
            'b23544efc282e4f2f7a418f1a55abfc0c8dd0f385d20188da3d6ff842aa29d3b'
            '7cd526bf0f61fa8eb65c8df10cad8992a20f934f7c717af1785e087616e67c2f')

build() {
  cd TSC-$_ver/tsc
  
  [ -d build ] && rm -rf build
  mkdir build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    
  make
}

package() {
  cd TSC-$_ver/tsc/build

  make DESTDIR="$pkgdir/" install

  # install desktop file
  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 "$srcdir"/$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
