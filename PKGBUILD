pkgname=seaweedfs
pkgver=1.70
pkgrel=1
pkgdesc="SeaweedFS is a simple and highly scalable distributed file system"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://github.com/chrislusf/seaweedfs"
license=('APACHE')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2ea33dca5eabcc236f590b98b76b52caddf44aa2ce64658d49720896ddab3267')

export CGO_LDFLAGS="$LDFLAGS"
export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"

prepare() {
  cd $pkgname-$pkgver
  export GOPATH="${SRCDEST:-$srcdir}"
  go mod vendor
}

build() {
  cd $pkgname-$pkgver
  make GOPATH="${SRCDEST:-$srcdir}"
}

package() {
  cd $pkgname-$pkgver
  install -D     weed/weed "$pkgdir"/usr/bin/weed
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE   "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
