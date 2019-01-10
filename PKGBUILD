pkgname=fluidkeys
pkgver=0.3.1
pkgrel=1
pkgdesc='Fluidkeys helps teams protect themselves with strong encryption.'
arch=('any')
url="https://www.fluidkeys.com"
license=('AGPL3')
makedepends=('go-pie' 'rsync' 'dep')
provides=("fluidkeys=$pkgver")
source=("https://github.com/fluidkeys/fluidkeys/archive/v0.3.1.tar.gz")
sha256sums=('6432f60ab7450d26f068368dff65f53fbdc44d3167afbb3f9d5b75762b40269d')

_gopath="gopath/src/github.com/fluidkeys/fluidkeys"

prepare(){
  mkdir -p "$srcdir/gopath/src/github.com/fluidkeys"
  ln -rTsf $pkgname-$pkgver "$srcdir/$_gopath"
  export GOPATH="$srcdir/gopath"
  cd $srcdir/$_gopath
  dep ensure
}

build() {
  cd "$srcdir/$_gopath"
  export GOPATH="$srcdir/gopath"
  make
}

package() {
  cd $srcdir/$_gopath
  export GOPATH="$srcdir/gopath"

  make install PREFIX="$pkgdir/usr"
}
