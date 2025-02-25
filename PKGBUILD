# Maintainer: Aryan Kothari aryan@aryankothari.dev
pkgname=longhorn-backup-repacker
pkgver=v1.1.16
pkgrel=4
pkgdesc="A tool to repack Longhorn backup files"
arch=('any')
url="https://github.com/thearyadev/longhorn-backup-repacker"
license=('MIT')
depends=('go')
makedepends=('git')

source=("$pkgname-$pkgver.tar.gz::https://github.com/thearyadev/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-${pkgver#v}"
    export CGO_CPPFLAGS=""
    export CGO_CFLAGS=""
    export CGO_CXXFLAGS=""
    export CGO_LDFLAGS=""
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags="-X main.version=${pkgver#v}" -o "$pkgname" .
}

package() {
    cd "$pkgname-${pkgver#v}"
    sudo install -Dm755 "$pkgname" "/usr/bin/$pkgname"
    sudo install -Dm644 LICENSE "/usr/share/licenses/$pkgname/LICENSE"
}
