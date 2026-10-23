# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=upmd
pkgver=0.2.7
pkgrel=1
pkgdesc="Markdown-based task and workflow runner"
arch=("x86_64")
url="https://github.com/rezigned/upmd"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("upmd")
conflicts=("upmd")
source=("$pkgname::git+$url#tag=v${pkgver}")
sha256sums=("SKIP")
options=(!lto)

build() {
    cd "$srcdir/$pkgname" || exit 1
    cargo build --release --config 'profile.release.opt-level="z"' --config 'profile.release.lto=true' --config 'profile.release.codegen-units=1' --config 'profile.release.panic="abort"'
}

package() {
    cd "$srcdir/$pkgname" || exit 1
    install -Dm755 "target/release/upmd" "$pkgdir/usr/bin/upmd"
    install -Dm644 "LICENSE"             "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "CHANGELOG.md"        "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 "README.md"           "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "DEMO.md"             "$pkgdir/usr/share/doc/$pkgname/DEMO.md"
}
