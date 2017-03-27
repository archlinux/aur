# Maintainer: Lukas L <l.levickas@gmail.com>

pkgname=gotwitch
pkgver=1.0.4
pkgrel=1
pkgdesc="Simple Twitch.tv command-line app to watch and query streams"
arch=(any)
url="https://deluxo.github.io/gotwitch/"
_ghuser="https://github.com/deluxo"
_gourl="github.com/deluxo/gotwitch"
license=('GPL')
makedepends=('go')
depends=('youtube-dl')
optdepends=('mpv: for watching a livestream' 'vlc: for  watching a livestream')
options=('!strip' '!emptydirs')
source=("$pkgname::git+$_ghuser/$pkgname.git")
md5sums=(SKIP)

build() {
  mkdir -p $srcdir/$pkgname/go/src/github.com/deluxo/$pkgname
  mkdir -p $srcdir/$pkgname/go/pkg
  mkdir -p $srcdir/$pkgname/go/bin
  mv $pkgname/$pkgname.go $srcdir/$pkgname/go/src/github.com/deluxo/$pkgname
  cd $srcdir/$pkgname/go/src/github.com/deluxo/$pkgname
  export GOPATH=$srcdir/$pkgname/go
  GOPATH=$srcdir/$pkgname/go go get -v -d ./ ...
  GOPATH=$srcdir/$pkgname/go go build -v -o "$srcdir/$pkgname/$pkgname"
}

package() {
	install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -D -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
