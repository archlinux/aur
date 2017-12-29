# Maintainer: jD91mZM2 <me@krake.one>
pkgname="synac-gtk-git"
pkgver=r75.0927f0a
pkgrel=2
pkgdesc="The synac GTK+ client"
url="https://github.com/synac-chat/client-gtk"
arch=("x86_64")
license=("MIT", "custom:MIT")
makedepends=("git" "rust")
optdepends=()
depends=()
source=("$pkgname::git+https://github.com/synac-chat/client-gtk")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    git submodule init
    git submodule update
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname"
    install -Dm 755 "target/release/client-gtk" "$pkgdir/usr/bin/synac-gtk"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
