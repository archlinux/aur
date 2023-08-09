# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Maxime Dirksen <aur@emixam.be>
# Contributor: Supdrewin <supdrewin at outlook dot com>
# Contributor: Andrey Kolchenko <andrey@kolchenko.me>
# Contributor: Rui ZHAO <renyuneyun@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>
pkgname=linux-enable-ir-emitter
pkgver=5.0.0
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
arch=('x86_64')
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=('MIT')
depends=(
    'fmt'
    'gtk3'
    'python'
    'opencv'
)
makedepends=(
    'meson'
    'qt6-base'
)
conflicts=(
    'chicony-ir-toggle'
    'linux-enable-ir-emitter-git'
)
install=linux-enable-ir-emitter.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/EmixamPP/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('efcee475e0494204ccf7a6834a72d39687eb02e8faa7f2281ca83e64c71aeb10db93aec701e1fdda4887df067978b0a1f5c361d6ae7a11854238d8e19d3a0d87')

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
