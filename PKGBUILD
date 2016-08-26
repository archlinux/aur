# Maintainer: Dany Marcoux <danymarcoux+archlinux@gmail.com>

pkgname=tag-ag
pkgver=1.2.1
pkgrel=1
pkgdesc='tag: Instantly jump to your ag matches'
arch=('i686' 'x86_64')
url='https://github.com/aykamko/tag'
license=('MIT') # https://github.com/aykamko/tag/blob/master/LICENSE
depends=('the_silver_searcher>=0.25')
makedepends=('go')
options=('!strip' '!emptydirs')
provides=('tag')
source=("https://github.com/aykamko/tag/archive/$pkgver.tar.gz")
sha256sums=('7fe2bcd1c758f12195ee3156736c237646b64c532060d7abb4b1ea888b811378')

prepare() {
  # Get tag's Go dependencies
  mkdir -p go
  export GOPATH="$srcdir/go"
  go get github.com/fatih/color
}

build() {
  # Build tag's binary
  export GOPATH="$srcdir/go"
  cd "tag-$pkgver"
  go build
}

package() {
  cd "tag-$pkgver"
  install -Dm755 "tag-$pkgver" "$pkgdir/usr/bin/tag"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/tag/LICENSE"
}
