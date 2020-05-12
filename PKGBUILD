pkgname=ncmdump
pkgver=0.3.3
pkgrel=1
pkgdesc="netease cloud music copyright protection file dump"
arch=('i686' 'x86_64')
url="https://github.com/yoki123/ncmdump"
license=('Apache')
makedepends=('git' 'go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yoki123/ncmdump/archive/v$pkgver.tar.gz")
sha256sums=('3cfec956892bb161aeac6cba30fe4db1dc984813cb1801990c282670a292966a')

prepare() {
    mkdir -p "$srcdir/build"
    export GOPATH="$srcdir/build"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"
    cd "$srcdir/$pkgname-$pkgver"
    go mod vendor
}

build() {
    export GOPATH="$srcdir/build"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"
    cd "$srcdir/$pkgname-$pkgver"
    go build -v -o ncmdump cmd/main.go
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/ncmdump" -t "$pkgdir/usr/bin"
}
