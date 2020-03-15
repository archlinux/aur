pkgname=seaweedfs
pkgver=1.63
pkgrel=2
pkgdesc="SeaweedFS is a simple and highly scalable distributed file system"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://github.com/chrislusf/seaweedfs"
license=('APACHE')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('dcd3cb8365bacdfd01ccf8142beadc7f759139b4d7442d78eaa8e4e62ed3307d')

export CGO_LDFLAGS="$LDFLAGS"
export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"
export GOPATH="${SRCDEST:-$srcdir}"

prepare() {
  cd $pkgname-$pkgver
  go mod vendor
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -D     weed/weed "$pkgdir"/usr/bin/weed
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE   "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
