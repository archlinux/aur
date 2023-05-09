# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Maxime Dirksen <aur@emixam.be>
# Contributor: Supdrewin <supdrewin at outlook dot com>
# Contributor: Andrey Kolchenko <andrey@kolchenko.me>
# Contributor: Rui ZHAO <renyuneyun@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>
pkgname=linux-enable-ir-emitter
pkgver=4.5.0
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
b2sums=('5b90cb2cc2abd8afd63b1ea689455402d57d2e16c530aae7610ee914bd792a72328cc562a694b2956b8ebb6fc0567be152a0b36ddf2eae4122119ca994e227cc')

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
