# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=caire
pkgver=1.2.6
pkgrel=1
pkgdesc="Content aware image resize library based on Seam Carving"
arch=('x86_64' 'i686')
url="https://github.com/esimov/caire"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/esimov/$pkgname/archive/v$pkgver.tar.gz")
makedepends=('go')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=$pkgver -extldflags ${LDFLAGS}" \
    -o "$pkgname" \
    cmd/caire/*.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('897dc62e48e73ac527458f7e11e7d3279cc7d9f4fa728741ae444b87e1c49183')
