# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Philipp Klein <philipptheklein@gmail.com>

pkgname=gdrive
pkgver=2.1.0
pkgrel=1
pkgdesc="Google Drive CLI Client"
arch=('x86_64' 'i686')
url="https://github.com/prasmussen/gdrive"
license=('MIT')
makedepends=('git' 'go' 'godep')
options=('!strip' '!emptydirs')
#source=(https://github.com/prasmussen/$pkgname/archive/$pkgver.tar.gz)
source=($pkgname-$pkgver::git://github.com/prasmussen/gdrive.git#commit=97981f7fd205353907135eacfc0e0ade24b88269)
sha256sums=('SKIP')

_gourl=github.com/prasmussen/gdrive
_gobuild=build/src/$_gourl

prepare() {
  mkdir -p "$(dirname $_gobuild)"
  cp -a "$srcdir/$pkgname-$pkgver" $_gobuild

  cd $pkgname-$pkgver
  GOPATH="$srcdir/build" godep restore
}

build() {
  GOPATH="$srcdir/build" go install -v -x $_gourl
}

#check() {
#  GOPATH="$srcdir/build" go test -v -x $_gourl
#}

package() {
  cd build
  install -Dm755 bin/gdrive "$pkgdir/usr/bin/gdrive"
}

