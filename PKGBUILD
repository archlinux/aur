# Maintainer: Ted pheenty Lukin <fedorlukin2006@gmail.com>

pkgname=icbm
pkgver=0.2.0
pkgrel=1
pkgdesc="It's a ClipBoard Manager! For wlroots-based wayland WMs. Written in Rust (🚀🚀🚀)"
arch=(any)
url="https://codeberg.org/pheenty/icbm"
license=('GPL-3.0-or-later')
depends=(cliphist wl-clipboard)
makedepends=(git cargo)
source=("git+$url#tag=$pkgver")
md5sums=('SKIP')

prepare() {
    # if user has pacman-installed rustup but it has no toolchain
    if command -v /usr/bin/rustup &> /dev/null && ! /usr/bin/rustup show active-toolchain &> /dev/null; then
        rustup default stable
    fi

    cd "$pkgname"
    cargo fetch --locked
}

build() {
    cd "$pkgname"
    cargo build -r --frozen
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
