# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Karro <karolina.lindqvist@kramnet.se>
# Contributor: maoserr
#
# Maintainer: SneakySnake <radiantstatue@gmail.com>
# Submit issues/pull requests at https://github.com/crumblingstatue/aur-iup

pkgname=iup
pkgver=3.15
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
  'a9af7f6229f998b059ed6dbcf53fcdaf'
  '367b7142a2f077c6a68cc9d76f20866a'
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
