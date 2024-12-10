# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=servicer-git
_pkgname=${pkgname%-git}
pkgver=0.1.13.r4.ged8f31c
pkgrel=1
pkgdesc="Simplify service management on systemd"
url="https://github.com/servicer-labs/servicer"
license=("MIT")
arch=("x86_64" "aarch64")
provides=("servicer")
conflicts=("servicer")
source=("git+$url")
makedepends=("git" "rust")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 2-
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm755 target/release/servicer -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
