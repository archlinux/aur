# Maintainer: Yan710010 <yan710010@126.com>

_pkgname=onion-keydisp
pkgname=onion-keydisp-git
pkgver=r7.4288931
pkgrel=1
pkgdesc='Keyboard visualizer for rhythm games'
arch=('x86_64')
url='https://codeberg.org/onion27/onion-keydisp'
license=('WTFPL')
depends=('wayland')
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
