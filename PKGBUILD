# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=comrak-git
pkgver=0.8.2.r2.g1a802a8
pkgrel=1
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=('x86_64' 'i686')
url="https://github.com/kivikakk/${pkgname%-git}"
license=('BSD')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('cargo-nightly' 'git' 'rust-nightly' 'rustup')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --always --tags --abbrev=7 HEAD |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    cargo fetch
}

build() {
    cd "${pkgname%-git}"
    cargo build --release --locked --features clap
}

check() {
    cd "${pkgname%-git}"
    cargo test --release --locked
}

package () {
    cd "${pkgname%-git}"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
