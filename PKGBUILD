# Maintainer: <clu@eeviac>

pkgname=montage
pkgver=6.1
pkgrel=1
_pkgtag="a8bde0beff7bf0625fa9eb8ce12397e4527ee05f"
pkgdesc="An astronomical image mosaic engine"
arch=('i686' 'x86_64')
url="http://montage.ipac.caltech.edu/"
license=('custom')
depends=()
makedepends=()
provides=()
conflicts=()
#source=("http://montage.ipac.caltech.edu/download/Montage_v$pkgver.tar.gz")
#source=("https://github.com/Caltech-IPAC/Montage/archive/refs/tags/v$pkgver.tar.gz")
source=("https://github.com/Caltech-IPAC/Montage/archive/a8bde0b.tar.gz")
sha1sums=('fa880dae390e1976ccb018fda4a2fb725aa89460')

build() {
  cd $srcdir/Montage-${_pkgtag}
  ./configure --prefix=/usr
  # Unsure if this is documented yet, but it is needed to build at the moment
  sed -i '17i #include <string.h>' grid/Pegasus/mPresentation.c
  #cd $srcdir/Montage-$pkgver
  make
}

package() {
  cd $srcdir/Montage-${_pkgtag}
  
  # The following is used because the montage developers
  # have not included an install method in their Makefile
  mkdir -p $pkgdir/usr/bin
  install -Dm755 bin/* $pkgdir/usr/bin

  # Provided by wcslib package...
  # https://archlinux.org/packages/extra/x86_64/wcslib/
  rm $pkgdir/usr/bin/HPXcvt

  #custom license...
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -Dm644 $srcdir/Montage-${_pkgtag}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # Find docs at:
  # http://montage.ipac.caltech.edu/docs/
  # Github info:
  # https://github.com/Caltech-IPAC/Montage
}
