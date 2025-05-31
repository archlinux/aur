# Maintainer: meskuku <meskuku@waifu.club>
pkgname=hcl-git
pkgver=r126.229369c
pkgrel=1
pkgdesc="A port to Linux of Hydra Castle Labyrinth (a 'metroidvania' kind of game)."
url="https://github.com/ptitSeb/hydracastlelabyrinth"
arch=('any')
license=('GPL2')
depends=('sdl2' 'sdl2_mixer')
makedepends=('git' 'cmake')
optdepends=('timidity: for MIDI support')
source=("git+https://github.com/ptitSeb/hydracastlelabyrinth.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/hydracastlelabyrinth"
  cmake . -DUSE_SDL2=ON
  make
}

package() {
  cd "$srcdir/hydracastlelabyrinth"

  install -d "$pkgdir/usr/lib/hcl"

  install -m755 hcl "$pkgdir/usr/lib/hcl/hcl"
  cp -a data "$pkgdir/usr/lib/hcl/"

  install -Dm644 "io.github.ptitSeb.hydracastlelabyrinth.desktop" \
    "$pkgdir/usr/share/applications/io.github.ptitSeb.hydracastlelabyrinth.desktop"
  install -Dm644 "io.github.ptitSeb.hydracastlelabyrinth.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.ptitSeb.hydracastlelabyrinth.png"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/hcl" <<'EOF'
#!/bin/sh
cd /usr/lib/hcl || exit 1
exec ./hcl "$@"
EOF
}
