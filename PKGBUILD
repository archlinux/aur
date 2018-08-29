# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=wmuc
pkgver=0.1.0
pkgrel=1
pkgdesc="A git repository manager."
arch=(x86_64)
url="https://github.com/mfinelli/wmuc"
license=(GPL3)
makedepends=(go dep)
source=("https://github.com/mfinelli/wmuc/archive/v$pkgver.tar.gz")
sha256sums=('eae6c270c42adae2018c3b7d775321c83cff36ce58b364193c0a8287669fb08c')

prepare() {
  export GOPATH="$srcdir"
  mkdir -p src/github.com/mfinelli
  mv $pkgname-$pkgver src/github.com/mfinelli/$pkgname
  cd src/github.com/mfinelli/$pkgname
  dep ensure
}

check() {
  export GOPATH="$srcdir"
  cd src/github.com/mfinelli/$pkgname
  make test
}

build() {
  export GOPATH="$srcdir"
  cd src/github.com/mfinelli/$pkgname
  make
}

package() {
  cd src/github.com/mfinelli/$pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
