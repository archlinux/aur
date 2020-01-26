# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=frece-git
pkgver=1.0.3.r6.g19ad727
pkgrel=1
pkgdesc="Frecency sorted database"
arch=("x86_64")
url="https://github.com/YodaEmbedding/frece"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("frece")
conflicts=("frece")
source=("$pkgname::git+https://github.com/YodaEmbedding/frece")
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
    install -Dm755 "target/release/frece" "$pkgdir/usr/bin/frece"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/frece/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/frece/README.md"
}
