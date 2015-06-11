# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wm2-svn
_pkgname=wm2
pkgver=r114
pkgrel=1
pkgdesc="The ideal window manager for today's elegant and ascetic programmer"
arch=('x86_64' 'i686')
url="http://www.all-day-breakfast.com/wm2/"
provides=('wm2')
conflicts=('wm2')
license=('custom')
depends=('libxmu')
makedepends=('setconf')
source=("$pkgname::svn://svn.code.sf.net/p/wm2/code/trunk/wm2"
        "wm2.desktop")
md5sums=('SKIP'
         '9daf70e6b6f5ca92670e06a65020ffbf')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $pkgname
  setconf Makefile LIBS	"-L/usr/X11/lib -lXext -lX11 -lXmu -lm -lstdc++"
  setconf Makefile CFLAGS "$CFLAGS -fpermissive"
}

build() {
  cd $pkgname
  make
  tail -31 README | head -20 > LICENSE
}

package() {
  cd $pkgname
  install -Dm755 wm2 "$pkgdir/usr/bin/wm2"
  install -Dm644 ../wm2.desktop "$pkgdir/usr/share/xsessions/wm2.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/REAME"
}

# vim:set ts=2 sw=2 et:
