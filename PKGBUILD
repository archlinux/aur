pkgname=niri-utils
pkgver=0.1.0
pkgrel=1
pkgdesc="Utilities for niri compositor (idle daemon + lock setup)"
arch=('x86_64')
url="https://github.com/youngcoder45/niri-utils"
license=('GPL3')

depends=('wayland' 'gtklock')
makedepends=('cargo' 'git')

source=("$pkgname::git+https://github.com/youngcoder45/niri-utils.git")
sha256sums=('SKIP')

build() {
    cd "$pkgname/niri-idle"
    cargo build --release
}

package() {
    cd "$pkgname"

    # install binary
    install -Dm755 "niri-idle/target/release/niri-idle" \
        "$pkgdir/usr/bin/niri-idle"

    # install lock script
    install -Dm755 "niri-lock/lock.sh" \
        "$pkgdir/usr/bin/niri-lock"

    # install configs (user can copy)
    install -Dm644 "niri-lock/config.ini" \
        "$pkgdir/usr/share/niri-lock/config.ini"

    install -Dm644 "niri-lock/style.css" \
        "$pkgdir/usr/share/niri-lock/style.css"
}