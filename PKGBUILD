# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=aur-out-of-date
pkgver=2.0.0
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
  go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/aur-out-of-date"
}

sha256sums=('0f93aa6546762d95ed85dbd2428ddb87c6b8efbc41bd0c5b6f671456d97b6128')
