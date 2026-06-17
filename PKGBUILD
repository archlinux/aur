# Maintainer: taxin <unknownbrofrombd@duck.com>

pkgname=ultrakill
pkgver=17d4
pkgrel=1
pkgdesc="A fast-paced ultraviolent retro FPS combining skill-based style scoring with old-school carnage"
arch=('x86_64')
url="https://store.steampowered.com/app/1229490/ULTRAKILL/"
license=('custom')
depends=(
  'glu'
  'mesa'
  'gcc-libs'
  'zlib'
  'libx11'
  'libxext'
  'libxrandr'
  'libxrender'
  'alsa-lib'
  'libpulse'
  'zenity'
)
optdepends=(
  'xorg-xwayland: play the game on Wayland compositors'
)
options=('!strip' '!debug')
source=('ultrakill.sh' 'ultrakill.desktop' 'ultrakill.png')
sha256sums=('SKIP' 'SKIP' 'SKIP')
install="${pkgname}.install"

prepare() {
  if [ ! -d "$srcdir/game" ]; then
    printf "\n%s\n" "============================================================"
    printf "%s\n" "  ULTRAKILL game files not found!"
    printf "%s\n" ""
    printf "%s\n" "  Place your game directory at: ${srcdir}/game/"
    printf "%s\n" "  Then run makepkg again."
    printf "%s\n" "============================================================"
    return 1
  fi
}

package() {
  install -d "$pkgdir/usr/share/$pkgname"
  cp -rL "$srcdir/game"/* "$pkgdir/usr/share/$pkgname/"
  chmod -R 755 "$pkgdir/usr/share/$pkgname"

  install -Dm755 "$srcdir/ultrakill.sh" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/ultrakill.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 "$srcdir/ultrakill.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
