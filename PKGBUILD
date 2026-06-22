# Maintainer: xander-lin <xander-lin@users.noreply.github.com>
# Contributor: screenshot-niri contributors

pkgname=screenshot-niri
pkgver=0.1.0
pkgrel=4
pkgdesc="Screenshot tool for niri compositor — normal and long/scroll capture with frozen-background selection overlay"
arch=('x86_64')
url="https://github.com/xander-lin/screenshot-niri"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
conflicts=('screenshot-plain')
source=("screenshot-niri::git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/screenshot-niri"
    cargo build --release --locked
}

check() {
    cd "$srcdir/screenshot-niri"
    cargo test --release --locked
}

package() {
    cd "$srcdir/screenshot-niri"
    install -Dm755 target/release/screenshot "$pkgdir/usr/bin/screenshot"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/" 2>/dev/null || true
}
