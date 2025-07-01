# Maintainer: Flack74 <puspendrachawlax@gmail.com>

pkgname=pom
pkgver=1.0.2
pkgrel=4
pkgdesc="A beautiful and feature-rich CLI Pomodoro timer with notifications and sound alerts."
arch=("x86_64")
url="https://github.com/Flack74/pom"
license=("MIT")
depends=("pulseaudio")
makedepends=("go" "git")
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/pom"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GOWORK=off
    go build -o pom ./cmd
}

package() {
    cd "$srcdir/pom"
    install -Dm755 pom "$pkgdir/usr/bin/pom"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 packaging/man/pom.1 "$pkgdir/usr/share/man/man1/pom.1"
}
