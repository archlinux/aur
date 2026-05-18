# Maintainer: Gigas002 <gigas002@pm.me>

pkgname=calendar-tui-git
_pkgname=calendar-tui
pkgver=r13.d142e7f
pkgrel=1
pkgdesc="Interactive terminal calendar built with ratatui"
arch=('x86_64' 'aarch64')
url="https://github.com/Gigas002/$_pkgname"
license=('GPL-3.0-only')
makedepends=('git' 'cargo')
options=('!strip')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release --all-features
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
