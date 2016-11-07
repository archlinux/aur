# Maintainer: gaelic
pkgname=swmm
pkgver=5.1.011
pkgrel=1
pkgdesc="Storm Water Management Model Engine"
url="http://www2.epa.gov/water-research/storm-water-management-model-swmm"
arch=('x86_64' 'i686')
license=('custom:OpenSource')
makedepends=('unzip')
source=("http://www.epa.gov/sites/production/files/2016-09/swmm51011_engine.zip"
	"swmm5.c.patch"
	"Makefile.patch")

md5sums=('2ec47a177df9035cb3933ca5f190557c'
         '257f5c7c8e01007382aceb718b3dbb7c'
         '49075bf9bee1e5dbad38bd7e765d05c4')

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
