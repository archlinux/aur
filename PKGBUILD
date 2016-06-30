# Maintainer: Olivier Biesmans <o.archlinux@biesmans.fr>

_pkgname=boom
_gopkgname=github.com/rakyll/boom
pkgname=go-$_pkgname-git
pkgver=r188.4a00fe2
pkgrel=1
pkgdesc="HTTP(S) load generator, ApacheBench (ab) replacement, written in Go"
arch=('x86_64' 'i686')
url="https://github.com/rakyll/boom"
license=('APACHE')
makedepends=('go' 'git')
depends=()
options=('!strip' '!emptydirs')
source=("$_pkgname::git+https://github.com/rakyll/boom.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  _gopkgpath="$srcdir/gopath/src/github.com/rakyll/boom" 
  if [[ ! -L "$_gopkgpath" ]]; then
    mkdir -p $(dirname $_gopkgpath)
    ln -s "$srcdir/boom" "$_gopkgpath"
  fi
}

build() {
  GOPATH="$(pwd)/gopath" go build -o "$srcdir/build/$_pkgname" "$_gopkgname"
}

package() {
  install -Dm755 "$srcdir/build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
