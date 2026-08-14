# Maintainer: Toolybird <toolybird at tuta dot io>

pkgname=shellbeats-git
_pkgname=${pkgname%-*}
pkgver=0.7.1.r9.gf486490
pkgrel=1
pkgdesc="Stream YouTube audio and mp3 download in the terminal"
arch=(x86_64)
url="https://github.com/lalo-space/shellbeats"
license=(GPL-3.0-only)
depends=(
  cjson
  curl
  glibc
  mpv
  ncurses
  which
  yt-dlp
)
makedepends=(git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  sed -e '/^CFLAGS/s/=/+=/' -e '/^\s*LDFLAGS/s/=/+=/' -i.bak "$_pkgname/Makefile"
}

build() {
  make -C "$_pkgname"
}

package() {
  install -vDm755 -t "$pkgdir/usr/bin" "$_pkgname/$_pkgname"
}
