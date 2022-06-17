# Maintainer: Adi Hascal <adi.hascal+aur at gmail dot com>
pkgname=cargo-xwin-git
pkgver=v0.8.7.r5.1c31b8c
pkgrel=1
pkgdesc='Cross compile Cargo project to Windows msvc target with ease'
arch=('x86_64')
url="https://github.com/messense/cargo-xwin"
license=('MIT')
makedepends=('git' 'cargo')
optdepends=('clang: for C/C++ dependencies' 'llvm: for assembly dependencies')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/messense/cargo-xwin')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
        cd "$srcdir/${pkgname%-git}"
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
        cd "$srcdir/${pkgname%-git}"
        cargo build --release --frozen
}

package() {
        cd "$srcdir/${pkgname%-git}"
        install -Dm0755 target/release/cargo-xwin "$pkgdir/usr/bin/cargo-xwin"
        install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
