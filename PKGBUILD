pkgname=fluidkeys
pkgver=0.4.0
pkgrel=1
pkgdesc='Simple PGP for engineering teams'
arch=('any')
url="https://www.fluidkeys.com"
license=('AGPL3')
makedepends=('go-pie' 'rsync' 'dep')
provides=("fluidkeys=$pkgver")
source=("https://github.com/fluidkeys/fluidkeys/archive/v${pkgver}.tar.gz")
sha256sums=('f3e1697ebb54acef5b11287577d650d377ab673509669afd73062fcb4f4bbeb3')

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
