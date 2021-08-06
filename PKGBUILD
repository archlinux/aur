# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=gping-git
pkgver=1.2.3.r4.ga95a678
pkgrel=1
pkgdesc="Ping, but with a graph"
arch=("x86_64")
url="https://github.com/orf/gping"
license=("MIT")
depends=("iputils")
makedepends=("cargo" "git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/^\(gping-\)\?v\?//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -Dm644 "readme.md" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
