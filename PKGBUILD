# Maintainer: Buce <dmbuce@gmail.com>

pkgname=i3b
pkgver=0.1.r2.g35d5d55
pkgver() {
  cd "$srcdir/$pkgname"
  if ! git describe --tags 2>/dev/null; then
    echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  fi | sed 's/-/.r/; s/-/./g'
}
pkgrel=1
pkgdesc="Window manager scripts and configs"
arch=(any)
url="https://github.com/DMBuce/i3b"
license=('GPL3')
groups=()
depends=(
  # i3move
  perl
  i3-wm
  xorg-xrandr
  xdotool

  # i3scratchmark
  bash
  jq

  # pickdate
  rofi
  awk

  # i3blocks-monit
  monit
)
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/DMBuce/${pkgname%-git}.git")
#source=("$pkgname::git+ssh://git@mantrid/~/${pkgname%-git}.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  make prefix=/usr sysconfdir=/etc localstatedir=/var DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
