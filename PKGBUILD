# Contributor: daurnimator <quae@daurnimator.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Karro <karolina.lindqvist@kramnet.se>
# Contributor: maoserr

pkgname=iup
pkgver=3.18
pkgrel=1
pkgdesc="C cross platform GUI toolkit"
arch=('i686' 'x86_64')
url="http://www.tecgraf.puc-rio.br/iup/"
license=('MIT')
depends=('libcd' 'libim')
options=(staticlibs)

source=(
  "http://downloads.sourceforge.net/project/iup/${pkgver}/Docs%20and%20Sources/iup-${pkgver}_Sources.tar.gz"
  "http://heanet.dl.sourceforge.net/project/iup/${pkgver}/Docs%20and%20Sources/iup-${pkgver}_Docs.pdf"
)

md5sums=(
  '60a3b03b14056364379cc195f95f897f'
  '08455b56beb828ab1a814299b217b5f9'
)

build() {
  cd "$pkgname"
  make iup iupcd iupcontrols iupgl iup_pplot iupim iupimglib ledc iupview \
    TEC_UNAME_DIR=. TEC_UNAME_LIB_DIR=. \
    CD_LIB=/usr/lib \
    CD_INC=/usr/include/cd \
    IM_LIB=/usr/lib \
    IM_INC=/usr/include/im \
    ZLIB_LIB=/usr/lib \
    IUPLIB="$srcdir/$pkgname"/lib \
    USE_LUA53=Yes \
    LUA_LIB=/usr/lib \
    NO_LUALINK=1
}

package() {
  install -m755 -d $pkgdir/usr/lib
  install -m644 iup/lib/* $pkgdir/usr/lib
  install -m755 -d $pkgdir/usr/include/iup
  install -m644 iup/include/* $pkgdir/usr/include/iup
  install -m755 -d $pkgdir/usr/share/$pkgname
  install -m644 iup-${pkgver}_Docs.pdf $pkgdir/usr/share/$pkgname
  mkdir -p $pkgdir/usr/share/licenses/iup
  install -m644 $srcdir/iup/COPYRIGHT $pkgdir/usr/share/licenses/iup
}
