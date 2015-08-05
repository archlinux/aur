# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Ian Naval <ianonavy@gmail.com>

pkgname=go-ipfs
pkgver=0.3.7
pkgrel=1
pkgdesc="global versioned p2p merkledag file system"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/ipfs/$pkgname"
license=('MIT')
makedepends=('go')
optdepends=('fuse: for mounting/advanced use')
conflicts=("$pkgname-git")
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('1c464e409f0d07f8a7c5510defbb0d602ea3049534cfc15dd4f69ed91bcd37a5f5ecce113921c66b416ad3c4372b986b6261438dad9eb795a502cbce8f728359')

build() {
  # Required for go get
  export GOPATH="$srcdir"

  # Make src directory for $GOPATH
  mkdir -p "$GOPATH/src"

  mv "$srcdir/$pkgname" "$GOPATH/src"
  cd "$GOPATH/src/$pkgname/cmd/ipfs"

  msg2 'Installing dependencies...'
  go get -v ./...

  msg2 'Building binary...'
  go install -v
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$srcdir/bin/ipfs" "$pkgdir/usr/bin/ipfs"
}
