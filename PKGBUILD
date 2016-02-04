# Maintainer: gaelic
pkgname=swmm
pkgver=5.1.010
pkgrel=1
pkgdesc="Storm Water Management Model Engine"
url="http://www2.epa.gov/water-research/storm-water-management-model-swmm"
arch=('x86_64' 'i686')
license=('custom:OpenSource')
makedepends=('unzip')
source=("http://www.epa.gov/sites/production/files/2015-08/swmm51010_engine.zip"
	"swmm5.c.patch"
	"Makefile.patch")

md5sums=('e7f341c88c5782bc4fee3840f5eacc5b'
         '257f5c7c8e01007382aceb718b3dbb7c'
         '9b410afa9d6f787fe95b07b99b2ee752')

makezip="makefiles.zip"
srczip="source$(echo $pkgver | tr \. \_)"

build() {
  unzip -o $srczip
  unzip -o $makezip
  unzip -o GNU-CLE
  cd $srcdir

  patch swmm5.c swmm5.c.patch
  patch Makefile Makefile.patch

  make || return 1
}

package() {
  mkdir -p $pkgdir/usr/bin
  mv swmm5 $pkgdir/usr/bin/
}
