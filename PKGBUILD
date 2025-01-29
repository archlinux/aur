# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Maxime Dirksen <aur@emixam.be>
# Contributor: Supdrewin <supdrewin at outlook dot com>
# Contributor: Andrey Kolchenko <andrey@kolchenko.me>
# Contributor: Rui ZHAO <renyuneyun@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>
pkgname=linux-enable-ir-emitter
pkgver=6.1.1
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
arch=(x86_64)
url=https://github.com/EmixamPP/linux-enable-ir-emitter
license=(MIT)
depends=(
    fmt
    gtk3
    opencv
    spdlog
    yaml-cpp
)
makedepends=(
    argparse
    meson
    qt6-base
    zlib
)
conflicts=(
    chicony-ir-toggle
    linux-enable-ir-emitter-git
)
install=linux-enable-ir-emitter.install
source=($pkgname-$pkgver.tar.gz::https://github.com/EmixamPP/$pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('d5579883bed68eef8a8549307fa4ce457cd0739a416ddad79b0c118e6dbfa85e92ec6e212c6e0b777247db85b62e14abc0ca9bf7ea2f7e72e86e95fad1e5d4ba')

build() {
    mkdir -p build
    arch-meson $pkgname-$pkgver build
    meson compile -C build
}

package() {
    cd $pkgname-$pkgver
    meson install -C ../build --destdir "$pkgdir"
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
