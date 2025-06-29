# Maintainer: Flack <your.email@example.com>
pkgname=pom
pkgver=1.0.0
pkgrel=1
pkgdesc="A feature-rich command-line Pomodoro timer written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/flack/pom"
license=('MIT')
depends=('libnotify' 'pulseaudio')
makedepends=('go' 'git')
source=("git+https://github.com/flack/pom.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
    cd "$pkgname"
    install -Dm755 pom "$pkgdir/usr/bin/pom"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
} 