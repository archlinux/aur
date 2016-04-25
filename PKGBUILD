# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=completion
pkgver=r273.1e5d4e3
pkgrel=1
pkgdesc="Editor and language agnostic completion backend"
url="https://github.com/quarnster/completion"
arch=('i636' 'x86_64')
license=('BSD')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
install="$pkgname.install"
source=('git://github.com/quarnster/completion.git' "$pkgname.install")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  mkdir -p go
  export GOPATH="$srcdir/go"
  go get -d github.com/quarnster/parser
  go get -d gopkg.in/fsnotify.v1
  go get -d github.com/robmerrell/comandante
  go get -d github.com/quarnster/util
  ln -sf go/src/github.com/quarnster/parser parser
  ln -sf "$srcdir/$pkgname" go/src/github.com/quarnster/$pkgname
  cd "$srcdir/$pkgname"
}

build() {
 cd "$srcdir/$pkgname/build"
 make GOPATH="$srcdir/go"
}

package() {
  cd "$srcdir/$pkgname/build"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
sha256sums=('SKIP'
            'baaa75b8f8e1edbd5d8eeb72456c55ed056214f3df337521d6334d67372bb8ae')
