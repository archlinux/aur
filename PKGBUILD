pkgname=nali-go
pkgver=0.4.5
_pkgver=0.4.5
pkgrel=1
pkgdesc='An offline tool for querying IP geographic information and CDN provider.'
arch=('x86_64')
url="https://github.com/zu1k/nali"
license=('MIT')
makedepends=("go>=2:1.18beta")
source=("https://github.com/zu1k/nali/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('3eddb93b656e800e7a79cebf0dbfbb68dd33054ad3e11481f541ebe532087cd5')

build() {
  cd "$srcdir/nali-$_pkgver"
   go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -X \"github.com/zu1k/nali/constant.Version=$_pkgver\" -extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd "$srcdir/nali-$_pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
