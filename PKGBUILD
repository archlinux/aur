# Maintainer: Flack74 <puspendrachawlax@gmail.com>

pkgname=pom
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI Pomodoro timer application"
arch=('x86_64')
url="https://github.com/Flack74/pom"
license=('MIT')
depends=()
makedepends=('go>=1.24')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    go mod download
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o pom
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 pom "$pkgdir/usr/bin/pom"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 packaging/man/pom.1 "$pkgdir/usr/share/man/man1/pom.1"
} 