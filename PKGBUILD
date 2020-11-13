# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=gping-git
pkgver=v0.1.5.r1.g7e8b360
pkgrel=1
pkgdesc="Ping, but with a graph"
arch=("x86_64")
url="https://github.com/orf/gping"
license=("unknown")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("gping")
conflicts=("gping")
source=("$pkgname::git+https://github.com/orf/gping")
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
    install -Dm755 "target/release/gping" "$pkgdir/usr/bin/gping"
    # install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/gping/LICENSE"
    install -Dm644 "readme.md" "$pkgdir/usr/share/doc/gping/README.md"
}
