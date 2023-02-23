# Maintainer: Dmitry Mozzherin <dmozzherin@gmail.com>

pkgname=gnfinder
pkgver=1.1.0
pkgrel=1
pkgdesc='Finder of bio scientific names in documents'
arch=('x86_64')
url="https://github.com/gnames/$pkgname"
license=('MIT')
makedepends=(
  'go'
  'make'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/gnames/gnfinder/archive/v1.1.0.tar.gz")
sha256sums=('42f917f6bb1034128ba2cdf4cdc5e32e82e7651e3d689bccf1858fec74cb1cb6')

build() {
  cd "$pkgname-$pkgver"
  make buildrel
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 "$srcdir/$pkgname-$pkgver/out/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
