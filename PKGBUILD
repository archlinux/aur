# Maintainer: Szizoid <overwhelming.baboon.vqfn@mask.me>

pkgname=charmander-git
pkgver=r13.2ed4522
pkgrel=1
pkgdesc="Wayland popup character picker — insert any Unicode symbol via hotkey"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/Szizoid/charmander"
license=('GPL-3.0-or-later')
depends=('gtk4' 'gtk4-layer-shell' 'wtype')
makedepends=('cargo' 'git')
provides=('charmander')
conflicts=('charmander')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/charmander "$pkgdir/usr/bin/charmander"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
