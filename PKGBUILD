pkgname=aiac
pkgver=5.3.0
pkgrel=1
pkgdesc='Artificial Intelligence Infrastructure-as-Code Generator'
arch=('x86_64')
url="https://github.com/gofireflyio/$pkgname"
license=('Apache-2.0')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('45e48cd8958d835b402e0e68d7aa8b9642deb535464dad5d6b83fb8f8ed3d79e')

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
