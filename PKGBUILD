pkgname=nali-go
pkgver=0.3.1
pkgrel=1
pkgdesc='An offline tool for querying IP geographic information and CDN provider.'
arch=('x86_64')
url="https://github.com/zu1k/nali"
license=('MIT')
makedepends=('go')
source=("https://github.com/zu1k/nali/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('033c4b451b7a450212d8d81459f6557091cc69cd231d0b5c99870ca3c6273980')

build() {
  cd "$srcdir/nali-$pkgver"
  go build \
    -trimpath \
    -ldflags "-X \"github.com/zu1k/nali/constant.Version=$pkgver\" -extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd "$srcdir/nali-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
