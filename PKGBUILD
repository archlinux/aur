# Maintainer: Dan Habot <dan.habot@gmail.com>
pkgname=backup-brute
pkgver=1.3
pkgrel=1
pkgdesc="Go utility for creating backups of large segments of your operating system to s3 using AGE encryption."
arch=('x86_64')
url="https://github.com/danhab99/backup-brute"
license=('MIT')
makedepends=('go')
source=("https://github.com/danhab99/backup-brute/tarball/$pkgver")

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

md5sums=('bdc7b4e443a627e9529f24206098e29d')
md5sums=('7d7d32ad963af021aead8e64efc3f359')
