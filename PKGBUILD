# Maintainer: Your Name <your.email@example.com>
pkgname=whatcable-linux
pkgver=0.1.1
pkgrel=1
pkgdesc="KDE Plasma 6 widget and CLI that shows what each USB cable and device can do"
arch=('x86_64')
url="https://github.com/Zetaphor/whatcable-linux"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'systemd-libs' 'kirigami' 'ki18n' 'kcoreaddons' 'kpackage' 'plasma-workspace' 'libplasma')
makedepends=('cmake' 'extra-cmake-modules')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('206677b650b05a1cf2e9ef8f892165685b985075517068a87a407d82cb90eb96')

build() {
    cmake -B build -S "${srcdir}/${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
