pkgname=nali-go
pkgver=0.4.0_rc1
_pkgver=0.4.0-rc1
pkgrel=1
pkgdesc='An offline tool for querying IP geographic information and CDN provider.'
arch=('x86_64')
url="https://github.com/zu1k/nali"
license=('MIT')
makedepends=("go>=2:1.18beta")
source=("https://github.com/zu1k/nali/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('f3de033108fb1b665baa24bb5620dc6d89dfd197417e36f14ac4b1e83773a493')

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
