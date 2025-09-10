pkgname=gtl
pkgver=0.2.0
pkgrel=1
pkgdesc="Transforms text into properly capitalized titles according to the Chicago Manual of Style"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/keircn/gtl"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/keircn/gtl.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd gtl
    export CGO_ENABLED=0
    export GOOS=linux
    go build -trimpath -buildmode=pie -mod=readonly -modcacherw \
      -ldflags "-s -w" \
      -o gtl cmd/gtl/main.go
}

check() {
    cd gtl
    go test ./...
}

package() {
    cd gtl
    install -Dm755 gtl "$pkgdir/usr/bin/gtl"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
