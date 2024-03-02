# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=uq-git
_pkgname=uq
pkgver=0.0.0.r0.g118bc2f
pkgrel=1
pkgdesc="uniq in Rust without needing to sort the input"
arch=("x86_64")
url="https://github.com/lostutils/uq"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$pkgname::git+https://github.com/lostutils/uq")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname" || exit 1
    git rev-parse --short HEAD | sed 's/^/0.0.0.r0.g/'
    # git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname" || exit 1
    cargo build --release
}

package() {
    cd "$pkgname" || exit 1
    install -Dm755 "target/release/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${_pkgname}/README.md"
}
