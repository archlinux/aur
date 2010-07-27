# $Id: PKGBUILD 22681 2010-07-26 17:40:27Z svenstaro $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Tom Wambold <tom5760@gmail.com>

pkgname='frogatto'
arch=('i686' 'x86_64')
pkgver=1.0
pkgrel=3
pkgdesc="An old-school 2d platformer game, starring a certain quixotic frog"
url="http://www.frogatto.com"
license=('GPL')
depends=('libgl' 'mesa' 'glew' 'sdl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'libpng' 'boost-libs' 'frogatto-data')
makedepends=('boost')
source=(http://www.frogatto.com/files/$pkgbase-$pkgver.tar.bz2
        frogatto
        frogatto.desktop)
md5sums=('13035e6bf1adbf15b38b9b655d67fcb9'
         '9ed2c9ea59e95fe3c0b3ad49e58f8890'
         'e31563b04748a39292a59aaad633ff58')

build() {
  cd "$srcdir/$pkgbase-$pkgver"

  sed -i 's/ccache //g' Makefile
  sed -i 's/-lprofiler//g' Makefile
  make game server
}

package() {
  cd "$srcdir/$pkgbase-$pkgver"

  install -D -m755 game $pkgdir/opt/frogatto/game
  install -D -m755 server $pkgdir/opt/frogatto/server

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/frogatto/LICENSE

  cd $srcdir
  install -DT -m755 frogatto $pkgdir/usr/bin/frogatto
  install -D -m644 frogatto.desktop $pkgdir/usr/share/applications/frogatto.desktop
}

package() {
  pkgdesc="An old-school 2d platformer game, starring a certain quixotic frog (data files)"
  arch=('any')
  depends=()

  cd "$srcdir/$pkgbase-$pkgver"

  mkdir -p $pkgdir/opt/frogatto/
  cp -r data $pkgdir/opt/frogatto/
  cp -r images $pkgdir/opt/frogatto/
  cp -r music $pkgdir/opt/frogatto/
  cp -r sounds $pkgdir/opt/frogatto/
  install -D -m644 FreeMono.ttf $pkgdir/opt/frogatto/FreeMono.ttf
  install -D -m644 DejaVuSans.ttf $pkgdir/opt/frogatto/DejaVuSans.ttf

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/frogatto-data/LICENSE
}

# vim:set ts=2 sw=2 et:
