# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Maxime Dirksen <aur@emixam.be>
# Contributor: Supdrewin <supdrewin at outlook dot com>
# Contributor: Andrey Kolchenko <andrey@kolchenko.me>
# Contributor: Rui ZHAO <renyuneyun@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>
pkgname=linux-enable-ir-emitter
pkgver=6.0.0
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
b2sums=('574bf50001aa079ba346dbacf9a72310abf6fbd3470ba81eac5258be831d4354907df5f4e1f6ab2747b82562dee42b306bf782645ddf2fe266b73e2bfab4f69e')

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
