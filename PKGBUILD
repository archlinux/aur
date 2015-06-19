# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Karro <karolina.lindqvist@kramnet.se>
# Contributor: maoserr
#
# Maintainer: SneakySnake <radiantstatue@gmail.com>
# Submit issues/pull requests at https://github.com/crumblingstatue/pkgbuilds

pkgname=iup
pkgver=3.14
pkgrel=1
pkgdesc="C cross platform GUI toolkit"
arch=('i686' 'x86_64')
url="http://www.tecgraf.puc-rio.br/iup/"
license=('MIT')
depends=('libcd')
optdepends=('lua: bindings for Lua are available'
            'cd: for additional controls support'
            'im: for advanced imaging support'
            'mesa: for OpenGL support')
options=(staticlibs)

source=(
  "http://downloads.sourceforge.net/project/iup/${pkgver}/Docs%20and%20Sources/iup-${pkgver}_Sources.tar.gz"
  "http://heanet.dl.sourceforge.net/project/iup/${pkgver}/Docs%20and%20Sources/iup-${pkgver}_Docs.pdf"
  makfiles.patch
)

md5sums=(
  'fce0f918d6e48a01521173f7f8b687a1'
  '3c96de1263691a5a6b42bcadb12513f2'
  '9c50f5376fe5cc0f459ec0148c452c57'
)

prepare() {
  cd $srcdir/$pkgname
  patch -b -p0 <../makfiles.patch
}

build() {
  cd $srcdir/$pkgname
  make iup iupcd iupcontrols iupgl iup_pplot iupim iupimglib ledc iupview
}

package() {
  cd $srcdir/$pkgname

  install -m755 -d $pkgdir/usr/lib
  install -m644 $srcdir/iup/lib/Linux*/* $pkgdir/usr/lib
  install -m755 -d $pkgdir/usr/share/$pkgname
  install -m644 $srcdir/iup-${pkgver}_Docs.pdf $pkgdir/usr/share/$pkgname
  install -m755 -d $pkgdir/usr/include/iup
  install -m644 $srcdir/iup/include/* $pkgdir/usr/include/iup
  mkdir -p $pkgdir/usr/share/licenses/iup
  install -m644 $srcdir/iup/COPYRIGHT $pkgdir/usr/share/licenses/iup
}
