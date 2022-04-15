# Maintainer: pinks <aur at papepati dot page>
pkgname=rome
pkgver=0.4.2
pkgrel=1
pkgdesc="Formatter, linter, bundler, and more for Javascript, Typescript, JSON, HTML, Markdown, and CSS."
arch=('any')
url="https://rome.tools"
license=('MIT')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rome/tools/archive/v${pkgver}.tar.gz")
md5sums=('1fd1d34fc5ed1b138310a839d9c0741e')

build() {
    cd "$srcdir/tools-$pkgver"
    export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=aarch64-linux-gnu-gcc
    export CARGO_PROFILE_RELEASE_LTO='true'
    export RUSTFLAGS='-C strip=symbols'
    export CARGO_TARGET_DIR=target
    cargo build -p rome_lsp -p rome_cli --release
}

package() {
    cd "$srcdir/tools-$pkgver"
    install -Dm0755 "target/release/rome" "${pkgdir}/usr/bin/rome"
    install -Dm0755 "target/release/rome_lsp" "${pkgdir}/usr/bin/rome_lsp"
    install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
