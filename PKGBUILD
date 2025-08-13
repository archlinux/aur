# Maintainer: mrkirill046 <contact@qwy-games.ru>
pkgname=sound-player-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Мощный, кроссплатформенный и лёгкий музыкальный плеер, построенный на Rust и Tauri"
arch=('x86_64')
url="https://github.com/mrkirill046/sound-player"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
provides=('sound-player')
conflicts=('sound-player')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/sound-player"
  git describe --tags --abbrev=0 | sed 's/^v//'
}

prepare() {
  cd "$srcdir/sound-player"
  pnpm install
}

build() {
  cd "$srcdir/sound-player"
  pnpm tauri build -b deb
}

package() {
  cp -a $srcdir/sound-player/src-tauri/target/release/bundle/deb/sound-player_${pkgver}_*/data/* "${pkgdir}"
}
