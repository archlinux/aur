# Maintainer: Dan Habot <dan.habot@gmail.com>
pkgname=backup-brute
pkgver=1.4.1
pkgrel=1.1
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
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -o backup-brute
}

package() {
  cd "$srcdir/backup-brute-$pkgver"
  install -Dm755 backup-brute "$pkgdir/usr/bin/backup-brute"
}

md5sums=('6520b8db331122e49a1e2d52b3473507')
