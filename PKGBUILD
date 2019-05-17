# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=frece-git
pkgver=1.0.0.r1.g4d037d3
pkgrel=1
pkgdesc="Frecency sorted database"
arch=("x86_64")
url="https://github.com/SicariusNoctis/frece"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("frece")
conflicts=("frece")
source=("$pkgname-$pkgver::git+https://github.com/SicariusNoctis/frece")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname-$pkgver"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/frece" "$pkgdir/usr/bin/frece"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/frece/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/frece/README.md"
}
