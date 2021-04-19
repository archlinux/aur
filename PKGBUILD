pkgname=nali-go
pkgver=0.2.4
pkgrel=1
pkgdesc='An offline tool for querying IP geographic information and CDN provider.'
arch=('x86_64')
url="https://github.com/zu1k/nali"
license=('MIT')
makedepends=('go')
source=("https://github.com/zu1k/nali/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ab9fedde0fa0880c413435e1003eb4ee60aa2c0ec6e9d6601d2fbbb60704591d')

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
