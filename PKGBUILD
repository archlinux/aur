# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Maxime Dirksen <aur@emixam.be>
# Contributor: Supdrewin <supdrewin at outlook dot com>
# Contributor: Andrey Kolchenko <andrey@kolchenko.me>
# Contributor: Rui ZHAO <renyuneyun@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>
pkgname=linux-enable-ir-emitter
pkgver=4.8.0
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
arch=('x86_64')
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=('MIT')
depends=(
    "fmt"
    "python"
    "opencv"
)
makedepends=('meson')
conflicts=(
    "chicony-ir-toggle"
    "linux-enable-ir-emitter-git"
)
install=linux-enable-ir-emitter.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/EmixamPP/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('285b301ea0d99e184ca86ef7ac6f51df6c497016fe8e65dd1a16554af85531c8d22200e090a1fb3fcd232c3d155b44bec3387c2c5fb4e589203ea2887174e4fc')

build() {
    cd "${srcdir}"
    mkdir -p build
    arch-meson $pkgname-$pkgver build
    meson compile -C build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson install -C ../build --destdir "$pkgdir"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
