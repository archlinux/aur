# Contributor: megadriver <megadriver at gmx dot com>
# Based on fuse-emulator
# Maintainer: SanskritFritz (gmail)

pkgname=fuse-emulator-sdl
pkgver=1.5.7
pkgrel=1
pkgdesc="The Free Unix Spectrum Emulator (SDL UI)."
arch=('i686' 'x86_64')
url="http://fuse-emulator.sourceforge.net/fuse.php"
license=("GPL2")
depends=('sdl' "libspectrum>=1.4.4" 'libxml2' 'libpng')
conflicts=('fuse-emulator')
source=("http://downloads.sourceforge.net/sourceforge/fuse-emulator/fuse-$pkgver.tar.gz"
        "fuse-emulator.png" "fuse-emulator.desktop")
md5sums=('d9c9085635726ae4fdbe2c40d82de695'
         '8c764eed97b5fc8d555bee1f0abf36f5'
         '883d4f908a2ca6601c5ec3f90c3b5596')

build() {
  cd "$srcdir"/fuse-$pkgver
  ./configure --prefix=/usr --without-gtk --with-sdl
  make
}

package() {
  cd "$srcdir"/fuse-$pkgver
  make DESTDIR=$pkgdir install
  install -D -m 644 "$srcdir"/fuse-emulator.desktop "$pkgdir"/usr/share/applications/fuse-emulator.desktop
  install -D -m 644 "$srcdir"/fuse-emulator.png "$pkgdir"/usr/share/pixmaps/fuse-emulator.png
}
