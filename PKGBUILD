# Maintainer: Radu Ursache <radu@ursache.ro>
pkgname=penguinsnap
pkgver=1.0.0
pkgrel=1
pkgdesc="Screenshot and OCR tool for Linux"
arch=('x86_64')
url="https://github.com/rursache/PenguinSnap"
license=('MIT')
depends=('qt6-base' 'qt6-wayland' 'kstatusnotifieritem' 'kglobalaccel' 'layer-shell-qt' 'tesseract' 'tesseract-data-eng' 'spectacle' 'wl-clipboard')
makedepends=('cmake' 'extra-cmake-modules' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/rursache/PenguinSnap/tar.gz/v${pkgver}")
sha256sums=('1fe50a2eec5ebc8239f017bc1b0ca28247d3d672d803e01d3b1d4a126c822e90')

build() {
    cmake -B build -S "${srcdir}/PenguinSnap-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAPP_VERSION="v${pkgver}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${srcdir}/PenguinSnap-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
