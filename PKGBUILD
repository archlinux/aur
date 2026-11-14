# Maintainer: nagnagi
pkgname=hyprtab
pkgver=0.1.0
pkgrel=1
pkgdesc='Alt-Tab style window switcher for Hyprland (Qt6/QML overlay)'
arch=('x86_64')
url='https://github.com/nagnagi/hyprtab'
license=('MIT')
depends=(
    'hyprland'
    'qt6-declarative'
)
makedepends=(
    'cmake'
    'git'
    'qt6-base'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nagnagi/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cmake -S "${srcdir}/${pkgname}-${pkgver}" -B "${srcdir}/build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build "${srcdir}/build" -j"$(nproc)"
}

package() {
    install -Dm755 "${srcdir}/build/hyprtab" "${pkgdir}/usr/bin/hyprtab"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}-${pkgver}/LICENSE"
}
