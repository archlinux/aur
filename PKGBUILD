# Maintainer: Flack <your.email@example.com>
pkgname=pom
pkgver=1.0.0
pkgrel=1
pkgdesc="A feature-rich command-line Pomodoro timer written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/Flack74/Pom"
license=('MIT')
depends=('libnotify' 'pulseaudio')
makedepends=('go' 'git')
source=("git+https://github.com/Flack74/Pom.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    go build -o pom
}

package() {
    cd "$pkgname"
    install -Dm755 pom "$pkgdir/usr/bin/pom"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
} 