# Maintainer: Flack74 <puspendrachawlax@gmail.com>
pkgname=pom
pkgver=1.0.1
pkgrel=1
pkgdesc="A feature-rich command-line Pomodoro timer written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/Flack74/pom"
license=('MIT')
depends=('libnotify' 'pulseaudio')
makedepends=('go' 'git')
source=("git+https://github.com/Flack74/pom.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X pom/cmd.version=v${pkgver} -X pom/cmd.buildDate=$(date +%Y-%m-%d_%H:%M:%S)"
}

package() {
    cd "$pkgname"
    install -Dm755 pom "$pkgdir/usr/bin/pom"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 packaging/man/pom.1 "$pkgdir/usr/share/man/man1/pom.1"
    gzip -9 "$pkgdir/usr/share/man/man1/pom.1"
} 