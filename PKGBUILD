# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Tom Wambold <tom5760@gmail.com>

pkgname='frogatto'
arch=('i686' 'x86_64')
pkgver=1.2
pkgrel=7
pkgdesc='Old-school 2d platformer game, starring a certain quixotic frog'
url="http://www.frogatto.com"
license=('GPL')
depends=('glew' 'sdl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'libpng' 'boost-libs' 'frogatto-data')
makedepends=('mesa' 'boost')
source=("frogatto-$pkgver.tar.gz::https://github.com/frogatto/frogatto/tarball/$pkgver"
        frogatto
        frogatto.desktop)
md5sums=('b60924f384e04728eb6e76cdd48ab8f9'
         '9ed2c9ea59e95fe3c0b3ad49e58f8890'
         'e31563b04748a39292a59aaad633ff58')

build() {
  cd "$srcdir/$pkgname-$pkgname"*

  sed -i 's/ccache //g' Makefile
  sed -i 's/-lprofiler//g' Makefile
  sed -i 's/\.io_service/\.get_io_service/g' src/server.cpp
  sed -i 's/-lboost_regex-mt/-lboost_regex/g' Makefile
  sed -i 's/-lboost_system-mt/-lboost_system/g' Makefile
  sed -i 's/-lboost_thread-mt/-lboost_thread/g' Makefile
  sed -i 's/-lboost_iostreams-mt/-lboost_iostreams/g' Makefile
  make game server
}

package() {
  cd "$srcdir/$pkgname-$pkgname"*

  install -D -m755 game $pkgdir/opt/frogatto/game
  install -D -m755 server $pkgdir/opt/frogatto/server

  install -D -m644 src/LICENSE $pkgdir/usr/share/licenses/frogatto/LICENSE

  cd $srcdir
  install -DT -m755 frogatto $pkgdir/usr/bin/frogatto
  install -D -m644 frogatto.desktop $pkgdir/usr/share/applications/frogatto.desktop
}

# vim:set ts=2 sw=2 et:
