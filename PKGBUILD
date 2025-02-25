# Maintainer: Aryan Kothari aryan@aryankothari.dev
pkgname=longhorn-backup-repacker
pkgver=v1.2.2
pkgrel=7
pkgdesc="A tool to repack Longhorn backup files"
arch=('any')
url="https://github.com/thearyadev/longhorn-backup-repacker"
license=('MIT')
depends=()
makedepends=('git' 'go')
_commit=f7ce2f16d2dd61952eec233fbe26ab3c4a900df8

source=("$pkgname-$pkgver.tar.gz::https://github.com/thearyadev/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-${pkgver#v}"
    export CGO_CPPFLAGS=""
    export CGO_CFLAGS=""
    export CGO_CXXFLAGS=""
    export CGO_LDFLAGS=""
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags="-X main.version=${pkgver#v} -X main.commit=$_commit" -o "$pkgname" .
}

package() {
    cd "$pkgname-${pkgver#v}"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
