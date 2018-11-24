# Maintainer: <clu@eeviac>

pkgname=montage
pkgver=6.0
pkgrel=1
pkgdesc="An astronomical image mosaic engine"
arch=('i686' 'x86_64')
url="http://montage.ipac.caltech.edu/"
license=('custom')
depends=()
makedepends=()
provides=()
conflicts=()
source=("http://montage.ipac.caltech.edu/download/Montage_v$pkgver.tar.gz")
sha1sums=('2dce8874cafc2842574747477312aa43cb950c45')

build() {
  cd $srcdir/Montage
  make
}

package() {
  cd $srcdir/Montage
  
  # The following is used because the montage developers
  # have not included an install method in their Makefile
  mkdir -p $pkgdir/usr/bin
  install -Dm755 bin/* $pkgdir/usr/bin

  # Provided by wcslib package...
  rm $pkgdir/usr/bin/HPXcvt

  #custom license...
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -Dm644 $srcdir/Montage/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  #Find docs at:
  #http://montage.ipac.caltech.edu/docs/
}
