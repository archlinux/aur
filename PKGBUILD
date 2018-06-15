# Maintainer: Jerry Jia <jerryjiahaha@gmail.com>
# Contributor: <clu@eeviac>
# Contributor: <janak@astronomie.cz>

pkgname=montage-git
_pkgname=Montage
pkgver=5.0
pkgrel=1
pkgdesc="An astronomical image mosaic engine"
arch=('i686' 'x86_64')
url="http://montage.ipac.caltech.edu/"
license=('custom')
depends=('freetype2' 'wcslib')
makedepends=()
provides=()
conflicts=('montage')
#source=("http://montage.ipac.caltech.edu/download/Montage_v$pkgver.tar.gz")
source=("git+https://github.com/Caltech-IPAC/Montage.git"
	"freetype.patch"
	"wcslib.patch")
#sha1sums=('c66d7ea01d3c11506b43759ade68c817092b120e')
sha1sums=('SKIP'
	'ac0c1e23d74b1c016eeb1bf63de240e788f4ff72'
	'80621edd384225fed83c550b4f22bc849e9a3d3d'
	)

prepare() {
  cd $srcdir/$_pkgname
  patch -p1 -i $srcdir/freetype.patch
  patch -p1 -i $srcdir/wcslib.patch
}

build() {
  cd $srcdir/$_pkgname
  make
}

package() {
  cd $srcdir/$_pkgname
  
  # The following is used because the montage developers
  # have not included an install method in their Makefile
  mkdir -p $pkgdir/usr/bin
  install -Dm755 bin/* $pkgdir/usr/bin

  #custom license...
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -Dm644 $srcdir/$_pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  #Find docs at:
  #http://montage.ipac.caltech.edu/docs/
}
