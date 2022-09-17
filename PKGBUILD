# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=simcoupe
pkgver=1.2.11
pkgrel=1
pkgdesc="The SAM Coupé Emulator"
arch=('i686' 'x86_64')
url="http://www.simcoupe.org/"
license=('GPL')
depends=('sdl' 'libsaasound')
makedepends=('make' 'imagemagick')
source=("https://github.com/simonowen/simcoupe/archive/refs/tags/v${pkgver}.tar.gz"
    "simcoupe.desktop")
md5sums=('57d0100ac726adbf3bf8d2fac4f06fca'
    'bd4dbdecfccb1eb86dfc9a23309bf5b9')

build() {
  cd "$srcdir/simcoupe-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
  convert Resource/SimCoupe.bmp simcoupe.png
}

package() {
  install -m755 -d $pkgdir/usr/{bin,share/applications,share/pixmaps}

  cd "$srcdir/simcoupe-${pkgver}"
  make install
  
  install -D -m644 ../../simcoupe.desktop $pkgdir/usr/share/applications
  install -D -m644 simcoupe.png $pkgdir/usr/share/pixmaps
  rm $pkgdir/usr/include/SAASound.h $pkgdir/usr/lib/libSAASound.so $pkgdir/usr/lib/libSAASound.so.3
}

# vim:set sts=2 ts=2 sw=2 et:
