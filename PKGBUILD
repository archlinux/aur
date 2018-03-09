# Maintainer: Kieran Colford <kzlcolfo@scspc645.cs.uwaterloo.ca>
pkgname=netlifyctl-git
pkgver=0.3.2.r2.g80a78fe
pkgrel=1
pkgdesc="CLI to manage and deploy sites on Netlify."
arch=('i686' 'x86_64')
url="https://github.com/netlify/netlifyctl"
license=('MIT')
depends=('go')
makedepends=('git')
_gourl=github.com/netlify/netlifyctl

prepare() {
  GOPATH="$srcdir" go get -d -fix -v $_gourl
}

pkgver() {
  cd "$srcdir"/src/$_gourl
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  GOPATH="$srcdir" go get -fix -v -x $_gourl/...
}

check() {
  GOPATH="$srcdir" go test -v -x $_gourl/...
}

package() {
  install -Dt "$pkgdir"/usr/bin/ "$srcdir"/bin/*
}

# vim:set ts=2 sw=2 et:
