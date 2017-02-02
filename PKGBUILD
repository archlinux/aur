# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=('go-unstable')
pkgdesc='The Go programming language -- latest unstable or RC release from the golang.org download page'
pkgver=1.8rc3
pkgrel=1
#arch=('x86_64' 'i686')
arch=('any')
url='http://golang.org/'
license=('BSD')
provides=('go')
conflicts=('go' 'go-git')
makedepends=('inetutils' 'go-bootstrap')
options=('!strip' 'staticlibs')
source=("https://storage.googleapis.com/golang/go${pkgver}.src.tar.gz")
md5sums=('c9a4acb510b2a66070e1b8bf7465abdb')
install="$pkgname.install"

build() {
  cd go/src
  export GOROOT_FINAL=/usr/lib/go
  export GOROOT_BOOTSTRAP=/opt/go-bootstrap

  # builds and checks
  ./all.bash

}

package() {
  install -Dm644 "$srcdir/go/LICENSE" "$pkgdir/usr/share/licenses/go/LICENSE"

  mkdir -p "$pkgdir/usr/lib"
  cp -a "$srcdir/go" "$pkgdir/usr/lib"

  mkdir -p "$pkgdir/usr/bin"
  for bin in "$pkgdir/usr/lib/go/bin/"*; do
    ln -s "/usr/lib/go/bin/$(basename $bin)" "$pkgdir/usr/bin/."
  done
}

# vim:set ts=2 sw=2 et:
