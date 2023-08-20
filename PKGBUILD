# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=chromacode-git
_pkgname=chromacode
pkgver=1.0.0.r2.g647cb71
pkgrel=1
pkgdesc="Generate colored code listings for LaTeX using Treesitter."
arch=("x86_64")
url="https://github.com/TomLebeda/chroma_code"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$pkgname::git+https://github.com/TomLebeda/chroma_code")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname" || exit 1
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname" || exit 1
    cargo build --release
}

package() {
    cd "$pkgname" || exit 1
    install -Dm755 "target/release/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "readme.md" "$pkgdir/usr/share/doc/${_pkgname}/readme.md"
}
