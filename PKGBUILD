# Maintainer: LambdAurora <aurora42lambda@gmail.com>
pkgname=rust-css-minifier-git
pkgver=34.ce9916a
pkgrel=1
pkgdesc="A simple command line tool which minifies CSS."
arch=('x86_64')
url="https://github.com/amgarrett09/rust-css-minifier"
license=('MIT')
depends=('rust')
makedepends=('cargo' 'git')
install=
source=("rust-css-minifier::git+https://github.com/amgarrett09/rust-css-minifier")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cargo build --release
}

package() {
    cd "$srcdir/${pkgname%-git}"

    install -Dm755 target/release/css-minifier "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

