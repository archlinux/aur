# Maintainer: 1337hero
pkgname=yeet-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast, minimal, configurable app launcher for Wayland"
arch=('x86_64')
url="https://github.com/1337hero/yeet"
license=('GPL3')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('cargo' 'git')
provides=('yeet')
conflicts=('yeet')
source=("git+https://github.com/1337hero/yeet.git")
sha256sums=('SKIP')

pkgver() {
    cd yeet
    if git describe --tags &>/dev/null; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd yeet
    cargo build --release --locked
}

package() {
    cd yeet
    install -Dm755 "target/release/yeet" "$pkgdir/usr/bin/yeet"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md" || true
}
