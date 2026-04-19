# Maintainer: Gigas002 <gigas002@pm.me>

pkgname=tofi-rs-git
_pkgname=tofi-rs
pkgver=r390.8b4c283
pkgrel=1
pkgdesc="A Wayland application launcher — Rust port of tofi"
arch=('x86_64' 'aarch64')
url="https://github.com/Gigas002/$_pkgname"
license=('MIT')
makedepends=('git' 'cargo')
depends=('wayland' 'cairo' 'pango' 'harfbuzz' 'libxkbcommon')
provides=("tofi=${pkgver}")
conflicts=('tofi' 'tofi-git')
options=('!strip')
source=("$_pkgname::git+$url.git#branch=rust")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tofi"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
