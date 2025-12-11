# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=demongrep-git
pkgver=r13.bb06f9c
pkgrel=1
pkgdesc="Fast, local semantic code search powered by Rust (git version)"
arch=('x86_64')
url="https://github.com/yxanul/demongrep"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'rust' 'cargo' 'protobuf' 'pkg-config')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cargo build --release --all-features
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
