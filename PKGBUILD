# Maintainer: Aryan Kothari aryan@aryankothari.dev
pkgname=longhorn-backup-repacker
pkgver=1.1.0
pkgrel=1
pkgdesc="A tool to repack Longhorn backup files"
arch=('any')
url="https://github.com/thearyadev/longhorn-backup-repacker"
license=('MIT')
depends=('go')
makedepends=('git')

source=("$pkgname-$pkgver.tar.gz::https://github.com/thearyadev/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace with actual SHA256 sum of your source file

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o $pkgname .
}

package() {
    cd "$pkgname-$pkgver"
    sudo install -Dm755 "$pkgname" "/usr/bin/$pkgname"
    
    # # Install license if you have one
    sudo install -Dm644 LICENSE "/usr/share/licenses/$pkgname/LICENSE"
}
