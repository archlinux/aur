# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Tom Wambold <tom5760@gmail.com>

pkgname='frogatto'
arch=('i686' 'x86_64')
pkgver=1.1.1
pkgrel=1
pkgdesc="An old-school 2d platformer game, starring a certain quixotic frog"
url="http://www.frogatto.com"
license=('GPL')
depends=('libgl' 'mesa' 'glew' 'sdl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'libpng' 'boost-libs' 'frogatto-data')
makedepends=('boost')
source=(http://www.frogatto.com/files/$pkgname-$pkgver.tar.bz2
        frogatto
        frogatto.desktop)
md5sums=('bf5a2ee4c3254a424766895ff250758b'
         '9ed2c9ea59e95fe3c0b3ad49e58f8890'
         'e31563b04748a39292a59aaad633ff58')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's/ccache //g' Makefile
  sed -i 's/-lprofiler//g' Makefile
  sed -i 's/-lboost_regex-mt/-lboost_regex/g' Makefile
  sed -i 's/-lboost_system-mt/-lboost_system/g' Makefile
  sed -i 's/-lboost_thread-mt/-lboost_thread/g' Makefile
  sed -i 's/-lboost_iostreams-mt/-lboost_iostreams/g' Makefile
  make game server
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D -m755 game $pkgdir/opt/frogatto/game
  install -D -m755 server $pkgdir/opt/frogatto/server

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/frogatto/LICENSE

  cd $srcdir
  install -DT -m755 frogatto $pkgdir/usr/bin/frogatto
  install -D -m644 frogatto.desktop $pkgdir/usr/share/applications/frogatto.desktop
}

# vim:set ts=2 sw=2 et:
