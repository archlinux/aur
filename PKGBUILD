pkgname=cosmic-applet-music-player-git
pkgver=0.1.r2.g20b1dd3
pkgrel=1
pkgdesc="Music Player control applet for the COSMIC panel (MPRIS) - git"
arch=('x86_64' 'aarch64')
url="https://github.com/Ebbo/cosmic-applet-music-player"
license=('GPL3')
provides=('cosmic-applet-music-player')
conflicts=('cosmic-applet-music-player')
depends=('dbus' 'openssl' 'cosmic-panel')
makedepends=('git' 'rust' 'cargo' 'just' 'clang' 'mold' 'pkgconf')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/cosmic-applet-music-player"
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long | sed 's/^v//;s/-/./g'
  else
    printf "0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/cosmic-applet-music-player"
}

build() {
  cd "$srcdir/cosmic-applet-music-player"
  nice just build-release
}

package() {
  cd "$srcdir/cosmic-applet-music-player"
  just rootdir="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
