# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=duckling-git
pkgver=18b35a8
pkgrel=1
pkgdesc='Tiny unfinished 2D platform game'
arch=('x86_64' 'i686')
url='http://github.com/xyproto/duckling'
license=('MIT')
depends=('python2' 'python2-pygame')
makdepends=('setconf' 'gendesk')
conflicts=('duckling')
provides=('duckling')
source=('duckling::git://github.com/xyproto/duckling.git')
md5sums=('SKIP')
_gfxdir='/usr/share/duckling/gfx'

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  setconf duckling.py GFX_DIR "\"$_gfxdir\""
  gendesk -n --pkgname duckling --pkgdesc "$pkgdesc"
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -d "${pkgdir}$_gfxdir"
  install -Dm644 gfx/* "${pkgdir}$_gfxdir"
  install -Dm755 duckling.py "$pkgdir/usr/bin/duckling"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 gfx/player.png "$pkgdir/usr/share/pixmaps/duckling.png"
  install -Dm644 duckling.desktop \
    "$pkgdir/usr/share/applications/duckling.desktop"
}

# vim:set ts=2 sw=2 et:
