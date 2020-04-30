# Maintainer: Lyova Potyomkin <lyova.potyomkin@gmail.com>
pkgname='rusted-tetris-git'
pkgver='0.1.0'
pkgrel='1'
pkgdesc="Terminal-based tetris clone written in pure Rust"
arch=('x86_64')
url="https://github.com/lyova-potyomkin/rusted-tetris"
license=('MIT')
makedepends=('git' 'rustup')
provides=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "$srcdir/${pkgname%-git}"
    cargo build --release --locked
}

check() {
    cd "$srcdir/${pkgname%-git}"
    cargo test --release --locked
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm 755 target/release/${pkgname%-git} -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
