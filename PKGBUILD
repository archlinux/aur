pkgname=swmm
pkgver=5.1.009
pkgrel=1
pkgdesc='Storm Water Management Model Engine'
arch=('i686' 'x86_64')
url='http://www2.epa.gov/water-research/storm-water-management-model-swmm'
license=('custom:OpenSource')
makedepends=('unzip')
source=(http://www2.epa.gov/sites/production/files/2015-05/swmm51009_engine_0.zip swmm5.c.patch Makefile.patch)

makezip="makefiles.zip"
srczip="source$(echo $pkgver | tr \. \_)"

md5sums=(18947dcf3f21153d387b432609781266 257f5c7c8e01007382aceb718b3dbb7c f2267133313a1cf705f187c74753ff9e)

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

