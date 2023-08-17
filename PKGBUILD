# Maintainer: Dan Habot <dan.habot@gmail.com>
pkgname=backup-brute
pkgver=1.1
pkgrel=1
pkgdesc="A Go program for backup brute forcing"
arch=('x86_64')
url="https://github.com/danhab99/backup-brute"
license=('MIT')
makedepends=('go')
source=("https://github.com/danhab99/backup-brute/tarball/$pkgver")
md5sums=('12e412662a8e449455460584807ae652')

prepare() {
  _dirname=$(tar -tf "${source[0]##*/}" | head -n 1 | cut -d/ -f1)
  mv $_dirname $pkgname-$pkgver
}

build() {
  cd "$srcdir/backup-brute-$pkgver"
  export GOPATH="$srcdir/gopath"
  export GO111MODULE=auto
  go build -o backup-brute
}

package() {
  cd "$srcdir/backup-brute-$pkgver"
  install -Dm755 backup-brute "$pkgdir/usr/bin/backup-brute"
}

