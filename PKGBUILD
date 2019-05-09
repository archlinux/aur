pkgname=fluidkeys
pkgver=1.1.1
pkgrel=1
pkgdesc='Simple PGP for engineering teams'
arch=('any')
url="https://www.fluidkeys.com"
license=('AGPL3')
makedepends=('go-pie' 'rsync' 'dep')
provides=("fluidkeys=$pkgver")
source=("https://github.com/fluidkeys/fluidkeys/archive/v${pkgver}.tar.gz")
sha256sums=('371ea207004745551bc35623fefe6f7d74783abd64292f1e67e6a857465fe43c')

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
