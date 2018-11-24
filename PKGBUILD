# Maintainer:
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=sdl-ball
pkgver=1.03
pkgrel=3
pkgdesc="A Breakout clone with pretty graphics"
arch=('x86_64')
url="http://sdl-ball.sourceforge.net/"
license=('GPL3')
depends=('glu' 'sdl_mixer' 'sdl_ttf' 'sdl_image' 'wiiuse')
source=("https://sourceforge.net/projects/sdl-ball/files/SDL-Ball_${pkgver}_build-6_src.tar.xz")
sha256sums=('6910a7166d16e3bfe4a67b538d02e25eec0d06276aef399b9143fd246cd76442')

build() {
  cd SDL-Ball_source_build_0006_src

  export LIBS='-lwiiuse'
  export CPPFLAGS+=' -DWITH_WIIUSE'

  export CFLAGS="$CXXFLAGS $CPPFLAGS"
  make DATADIR="/usr/share/sdl-ball/themes/"
}

package() {
  cd SDL-Ball_source_build_0006_src

  install -d "$pkgdir"/usr/share/sdl-ball/leveleditor
  cp -r README themes "$pkgdir"/usr/share/sdl-ball/
  cp -r leveleditor/{gfx,index.html} "$pkgdir"/usr/share/sdl-ball/leveleditor/
  install -Dm755 sdl-ball "$pkgdir"/usr/bin/sdl-ball
  install -Dm644 themes/default/icon32.png "$pkgdir"/usr/share/pixmaps/sdl-ball.png
  install -Dm644 sdl-ball.desktop "$pkgdir"/usr/share/applications/sdl-ball.desktop
}
