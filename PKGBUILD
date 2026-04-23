# Maintainer: Yan710010 <yan710010@126.com>

_pkgname=onionshot
pkgname=onionshot-git
pkgver=r27.8c2b7ac
pkgrel=1
pkgdesc='Screenshot tool for Hyprland'
arch=('x86_64')
url='https://codeberg.org/onion27/onionshot'
license=('WTFPL')
depends=('hyprland' 'wayfreeze' 'grim' 'slurp' 'wl-clipboard' 'libnotify')
makedepends=('cargo' 'git')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    cargo build --release
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
