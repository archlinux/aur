pkgname=softty-git
pkgver=r6.b0ff8a6
pkgrel=1
pkgdesc="A minimal, fast Wayland terminal emulator"
arch=('x86_64')
url="https://github.com/socatlolmeow/softty"
license=('GPL-3.0-or-later')
depends=('libxkbcommon')
makedepends=('cargo' 'git' 'pkgconf')
options=('!lto')
provides=('softty')
conflicts=('softty')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd softty
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd softty
    cargo build --release --locked
}

package() {
    cd softty
    install -Dm755 target/release/softty "$pkgdir/usr/bin/softty"
}
