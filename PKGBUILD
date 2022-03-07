pkgname=nali-go
pkgver=0.3.7
pkgrel=1
pkgdesc='An offline tool for querying IP geographic information and CDN provider.'
arch=('x86_64')
url="https://github.com/zu1k/nali"
license=('MIT')
makedepends=("go>=2:1.18beta")
source=("https://github.com/zu1k/nali/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cae428002cc8984cd4817fb1e277876806648c199cec42b5213bf1f0fba31e09')

build() {
  cd "$srcdir/nali-$pkgver"
   go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -X \"github.com/zu1k/nali/constant.Version=$pkgver\" -extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd "$srcdir/nali-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
