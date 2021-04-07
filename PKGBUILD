pkgname=nali-go
pkgver=0.2.3
pkgrel=1
pkgdesc='An offline tool for querying IP geographic information and CDN provider.'
arch=('x86_64')
url="https://github.com/zu1k/nali"
license=('MIT')
makedepends=('go')
source=("https://github.com/zu1k/nali/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a6fde277991bbb9b04f51083ae479da555d1892099578c76b4824f5f5354f581')

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
