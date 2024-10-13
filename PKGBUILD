# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Maxime Dirksen <aur@emixam.be>
# Contributor: Supdrewin <supdrewin at outlook dot com>
# Contributor: Andrey Kolchenko <andrey@kolchenko.me>
# Contributor: Rui ZHAO <renyuneyun@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>
pkgname=linux-enable-ir-emitter
pkgver=6.0.6
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
b2sums=('d850e6db96c17a3ad65e4b4b423e31ec13252682d6a4e8020c2a1b7066c718580444314b5307fc42d2054003cc0d41952958527e572fe3051ef71fb23f5cde53')

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
