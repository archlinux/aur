# Maintainer:
# Contributor: Michael Straube <michael.straubej@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=sdl-ball
pkgver=1.04
pkgrel=1
pkgdesc="A Breakout clone with pretty graphics"
arch=('x86_64')
url="http://sdl-ball.sourceforge.net/"
license=('GPL3')
depends=('glu' 'sdl_mixer' 'sdl_ttf' 'sdl_image' 'wiiuse')
source=("https://github.com/DusteDdk/SDL-Ball/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c2e45f3663dc79762bf88d23d19fa875fca6dc73cd38e5e80f803072b7761bb2f98a3b20a16ea14b7d260624602892914aa96b9a485ca16cb5dadcfacd3dd57c')

build() {
  cd SDL-Ball-$pkgver

  export LIBS='-lwiiuse'
  export CPPFLAGS+=' -DWITH_WIIUSE'

  export CXXFLAGS+=" $CPPFLAGS"
  make DATADIR="/usr/share/sdl-ball/themes/"
}

package() {
  cd SDL-Ball-$pkgver

  install -d "$pkgdir"/usr/share/sdl-ball/leveleditor
  cp -r README themes "$pkgdir"/usr/share/sdl-ball/
  cp -r leveleditor/{gfx,index.html} "$pkgdir"/usr/share/sdl-ball/leveleditor/
  install -Dm755 sdl-ball "$pkgdir"/usr/bin/sdl-ball
  install -Dm644 themes/default/icon32.png "$pkgdir"/usr/share/pixmaps/sdl-ball.png
  install -Dm644 sdl-ball.desktop "$pkgdir"/usr/share/applications/sdl-ball.desktop
}
