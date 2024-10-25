# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: tam1m <tbacc plus aur at pm dot me>
pkgname=sonusmix
pkgver=v0.1.1
pkgrel=1
pkgdesc="Next-gen Pipewire audio routing tool"
arch=('x86_64')
url="https://codeberg.org/sonusmix/sonusmix"
license=('MPL-2.0')
depends=('pipewire' 'gtk4')
makedepends=('clang' 'cargo' 'git')
source=("https://codeberg.org/sonusmix/sonusmix/archive/v0.1.1.tar.gz"
        "sonusmix.desktop")
sha256sums=('363e5780924ac28041bd8596e9d570ac3e6491a2324680dd00a6469f05e65581'
            'cf3059786a8e6d62f72979954ef6e9730575ec3d2ec1dcd5ddae78f043765f9a')

build() {
    cd "$srcdir/$pkgname"
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/usr/share/icons"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/licenses/${pkgname}"

    install -Dm755 "$pkgname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname/assets/sonusmix.svg" "$pkgdir/usr/share/icons/"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/"
    install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/"
}
