# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=licensor-git
pkgver=v1.0.1.r0.gf498f64
pkgrel=1
pkgdesc="Write a license to standard output given its SPDX ID"
arch=("x86_64")
url="https://github.com/raftario/licensor"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=()
conflicts=()
source=("$pkgname::git+https://github.com/raftario/licensor")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/licensor" "$pkgdir/usr/bin/licensor"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/licensor/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/licensor/README.md"
}
