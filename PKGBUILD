# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=aur-out-of-date
pkgver=3.1.0
pkgrel=1
pkgdesc="Determines out-of-date AUR packages"
arch=('x86_64' 'i686')
url="https://github.com/simon04/aur-out-of-date"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/simon04/$pkgname/archive/v$pkgver.tar.gz")
makedepends=('go' 'git')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  go mod download
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  go test $(go list ./...)
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/aur-out-of-date"
}

sha256sums=('e65127638c411ebfe4c8d9929262f7147c399c9e85648c9eea3fd0495cdd1b67')
