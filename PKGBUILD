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
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

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
