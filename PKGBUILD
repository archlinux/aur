# Maintainer Zanny <lordzanny@gmail.com>
# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=gzdoom-2.1
pkgver=2.1.1
pkgrel=1
pkgdesc="Doom source port based on ZDoom with an OpenGL renderer."
arch=('i686' 'x86_64')
url="http://www.osnanet.de/c.oelckers/gzdoom/"
license=('custom')
provides=(gzdoom)
conflicts=(gzdoom gzdoom-git)
depends=('gtk2' 'sdl2' 'mpg123' 'openal' 'libsndfile')
makedepends=('nasm' 'cmake' 'imagemagick' 'mesa')
optdepends=('blasphemer: Blasphemer (free Heretic) game data'
            'chexquest3-wad: Chex Quest 3 game data'
            'doom1-wad: Doom shareware game data'
            'freedoom: FreeDoom game data'
            'hacx-wad: HacX game data'
            'harmony-wad: Harmony game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data'
            'strife0-wad: Strife shareware game data'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data'
            'kdebase-kdialog: Provides Qt based startup dialog support')
source=(https://github.com/coelckers/gzdoom/archive/g${pkgver}.tar.gz
        gzdoom.desktop)
sha256sums=('cdba2fcb2a74872512c8ee8d16102ff9d5eaf8e03a37764d21ca93f6b937afd1'
            '2a0b837ddc423d3a6be50f60735c55ee27cd26f58c42540b44aab395030b9cc4')

_sharedir=/usr/share/games/gzdoom

build() {
  cd gzdoom-g$pkgver
  cmake -DCMAKE_CXX_FLAGS="$CXXFLAGS -DSHARE_DIR=\\\"$_sharedir\\\"" .
  make

  convert "src/win32/icon1.ico[2]" gzdoom.png
}

package() {
  cd gzdoom-g$pkgver

  install -Dm755 gzdoom "$pkgdir/usr/bin/gzdoom"
  install -Dm644 gzdoom.pk3 "$pkgdir/$_sharedir/gzdoom.pk3"
  install -Dm644 brightmaps.pk3 "$pkgdir/$_sharedir/brightmaps.pk3"
  install -Dm644 lights.pk3 "$pkgdir/$_sharedir/lights.pk3"

  install -Dm644 gzdoom.png "$pkgdir/usr/share/pixmaps/gzdoom.png"
  install -Dm644 "$srcdir/gzdoom.desktop" "$pkgdir/usr/share/applications/gzdoom.desktop"
  install -Dm644 docs/BUILDLIC.TXT "$pkgdir/usr/share/licenses/$pkgname/buildlic.txt"
  install -Dm644 docs/doomlic.txt "$pkgdir/usr/share/licenses/$pkgname/doomlic.txt"
}
