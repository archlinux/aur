# Maintainer: Jeremy Symon <jtsymon@gmail.com>
pkgname='itch-setup-git'
_gitname='itch-setup'
pkgdesc='An installer for the itch.io desktop app'
arch=('x86_64' 'i686')
license=('MIT')
depends=()
makedepends=('git' 'go')
provides=('itch' 'kitch')
pkgver=1.13.0.r0.g8780d58
pkgrel=1
source=(
  "git+https://github.com/itchio/${_gitname}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  mkdir -p $GOPATH $GOBIN
  cd "$_gitname"
  go get -v -tags gtk_3_18
}

package() {
  install -Dm755 "bin/itch-setup" "$pkgdir/usr/bin/itch"
  ln -s "itch" "$pkgdir/usr/bin/kitch"
  install -Dm644 "$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
