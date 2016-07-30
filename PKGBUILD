# Maintainer: aksr <aksr at t-com dot me>
pkgname=torrent-git
pkgver=r1306.00f4067
pkgrel=1
epoch=
pkgdesc="Full-featured BitTorrent client package and utilities"
arch=('i686' 'x86_64')
url="https://github.com/anacrolix/torrent"
license=('MPL')
groups=()
depends=('')
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=('torrent')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/anacrolix/torrent

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get ${_gourl}/cmd/...
}

package() {
  cd "$srcdir"
  for i in bin/*; do
    install -Dm755 $i "$pkgdir/usr/$i"
  done
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl}/TODO $pkgdir/usr/share/doc/${pkgname%-*}/TODO
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

