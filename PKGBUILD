pkgname=aiac
pkgver=5.0.1
pkgrel=1
pkgdesc='Artificial Intelligence Infrastructure-as-Code Generator'
arch=('x86_64')
url="https://github.com/gofireflyio/$pkgname"
license=('Apache-2.0')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76062407f5e88c636bbea1e022b96378b3d73a4715ba296752f8de2374fa7e95')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build/
}

build() {
    cd "$pkgname-$pkgver"
    go build -ldflags="-linkmode=external -X 'github.com/gofireflyio/aiac/v5/libaiac.Version=$pkgver'" -buildmode=pie -trimpath -mod=readonly -modcacherw -o build/$pkgname
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
