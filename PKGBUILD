# Maintainer: pzl <alsoelp@gmail.com>
# Contributor: Diego <cdprincipe@at@gmail@dot@com>
# Contributor: Frikilinux <frikilinux@gmail.com.ar> 

_pkgname=stitchy
pkgname=stitchy-git
pkgver=7610be8
pkgrel=2
pkgdesc="Cross stitch pattern designer."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qjson')
makedepends=('git')
url="https://github.com/segfault87/stitchy"
install=stitchy.install
source=(git+https://github.com/segfault87/stitchy.git
        stitchy.desktop)
md5sums=('SKIP'
         '126841e4b1ff8c8ab949b6be1b2a801c')


pkgver() {
  cd $srcdir/$_pkgname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $srcdir/$_pkgname
  qmake-qt4
  make
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 stitchy "$pkgdir/usr/bin/stitchy"
  install -Dm644 $srcdir/stitchy.desktop "${pkgdir}/usr/share/applications/stitchy.desktop"
  install -Dm644 $srcdir/stitchy/icons/fallback/stitch-full.png "${pkgdir}/usr/share/pixmaps/stitchy.png"
}

