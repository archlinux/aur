# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=rex-git
pkgver=r292.ff6adf2
pkgrel=1
_pkgname=rex
pkgdesc="A lean terminal hex editor written in Rust"
arch=("x86_64")
url="https://github.com/dbrodie/rex"
license=("MIT/Apache-2.0")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("rex")
conflicts=("rex")
source=("$_pkgname::git+https://github.com/dbrodie/rex")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    # git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"

    # Use latest packages since old ones do not seem to build correctly.
    cargo update

    cargo build --release
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/trex" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-APACHE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
