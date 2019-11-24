# Maintainer: Vicente Reyes <vreyesvaldivieso@gmail.com>
pkgname=funkicrab-git
pkgver=r18.98528cc
pkgrel=1
pkgdesc="Optimising Brainfuck compiler written in Rust"
arch=('x86_64')
url="https://github.com/zesterer/funkicrab"
license=('unknown')
depends=('gcc-libs')
makedepends=('rust-nightly')
source=("git+git://github.com/zesterer/funkicrab.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cargo +nightly build --release --locked
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm 755 target/release/${pkgname%-git} -t "${pkgdir}/usr/bin"
}
