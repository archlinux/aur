# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=galene-file-transfer
pkgver=0.2
pkgrel=1
pkgdesc="Galene's peer-to-peer file transfer protocol for the CLI."
arch=('x86_64' 'i686')
url='https://galene.org'
license=('MIT')
depends=('go')
source=("https://github.com/jech/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('6de6fa1c12eca0197f3e01e4f92c2f3736a91740e0692f702ddc8d228d112ec8')

prepare() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  mkdir -p _build
}

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  export CGO_ENABLED=0
  go build \
     -trimpath \
     -buildmode=pie \
     -mod=readonly \
     -modcacherw \
     -ldflags "-s -w" \
     -o _build \
     ./...
}

check() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  go test ./...
}

package() {
  cd "$pkgname-$pkgname-$pkgver"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "_build/galene-file-transfer" "${pkgdir}/usr/bin"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
