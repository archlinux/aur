# Maintainer: Michael Straube <michael_straube web de>
# Contributor: pj1031999 <pj1031999@gmail.com>
# Contributor: Michal Docekal <docekal@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers (at) archlinux (dot) us>

pkgname=block-attack
pkgver=1.4.2
pkgrel=3
pkgdesc="An open source clone of Tetris Attack based on SDL"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/blockattack"
license=('GPL')
depends=('enet' 'physfs' 'sdl_mixer' 'sdl_image' 'sdl_ttf')
source=("http://downloads.sourceforge.net/blockattack/blockattack-$pkgver.tar.bz2"
        "block-attack.patch"
        "block-attack")
sha1sums=('fb3cbe97e7ce3a59f1a6d304a86823bec4b47fd0'
          'f3b5390dd0ac4b5ec3682f2eca376d96182cae5b'
          'e124e5ce75c7e10b5817033e84870d0c607bcdb8')

prepare() {
  cd blockattack-$pkgver

  # patch the Makefile
  patch -p0 < "$srcdir/block-attack.patch"
}

build() {
  cd blockattack-$pkgver

  make
}

package() {
  cd blockattack-$pkgver

  make DESTDIR="$pkgdir" install

  find "$pkgdir" -type f -exec chmod 644 {} \;
  find "$pkgdir" -type d -exec chmod 755 {} \;

  install -Dm644 source/misc/blockattack.desktop \
    "$pkgdir/usr/share/applications/block-attack.desktop"

  install -Dm644 Game/gfx/icon.png \
    "$pkgdir/usr/share/pixmaps/block-attack.png"

  install -Dm755 Game/blockattack \
    "$pkgdir/usr/lib/block-attack/blockattack"

  install -Dm755 "$srcdir/block-attack" \
    "$pkgdir/usr/bin/block-attack"

  rm "$pkgdir/usr/share/games/block-attack/blockattack"
}
