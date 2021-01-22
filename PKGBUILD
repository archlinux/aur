pkgname=ncmdump
pkgver=0.3.6
pkgrel=1
pkgdesc="netease cloud music copyright protection file dump"
arch=('i686' 'x86_64')
url="https://github.com/yoki123/ncmdump"
license=('Apache')
makedepends=('git' 'go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yoki123/ncmdump/archive/v$pkgver.tar.gz")
sha256sums=('8828afd00c3ee83be0656b4264e3f6ace1c39ea3ea53ed2caeafaffac7c81267')

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
    go build -v -o ncmdump cmd/ncmdump/main.go
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/ncmdump" -t "$pkgdir/usr/bin"
}
