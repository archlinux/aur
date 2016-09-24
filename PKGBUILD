# Maintainer: Mittens <mittens2001@opmbx.org>

pkgname=speakerbot-git
_pkgname=speakerbot
pkgver=r17.51b0836
pkgrel=1
pkgdesc="Multiserver music bot for Discord written in Go"
arch=('x86_64' 'i686')
url="https://github.com/dustinblackman/speakerbot"
license=('MIT')
depends=('ffmpeg' 'opus-tools')
makedepends=('glide' 'go' 'git')
options=('!strip' '!emptydirs')
source=('git+https://github.com/dustinblackman/speakerbot')
md5sums=('SKIP')

_url=github.com/dustinblackman/$_pkgname

pkgver() {
  cd "$srcdir/../$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/$_url"
  mv "$srcdir/$_pkgname" "$GOPATH/src/$_url/.."

  msg2 "Building package dependencies..."
  cd "$GOPATH/src/$_url"
  glide install
}

build() {
  export GOPATH="$srcdir"
  cd "$GOPATH/src/$_url"
  make
}
 

package() {
  cd "$srcdir/src/$_url"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/license/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
