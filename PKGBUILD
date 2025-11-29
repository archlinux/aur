# Maintainer: Christopher Dolan <siricandobhikkhu@gmail.com>
pkgname=hypr-cycle-git
giturl="https://github.com/christopherdolan/hypr-cycle.git"
pkgver=0.5.0.0.g20031ca
pkgrel=1
pkgdesc="A fast and monitor-aware workspace cycler for Hyprland, written in Rust"
provides=("hypr-cycle")
conflicts=("hypr-cycle")
arch=('x86_64')
url="${giturl}"
license=('MIT')
makedepends=('cargo')
source=("${pkgname}::git+${giturl}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long --always | sed 's/^v//' | sed 's/-/./g'
}

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/hypr-cycle "$pkgdir/usr/bin/hypr-cycle"
}
