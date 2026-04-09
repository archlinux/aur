# Maintainer: Radu Ursache <radu@ursache.ro>
pkgname=penguinsnap
pkgver=1.1.0
pkgrel=1
pkgdesc="Screenshot and OCR tool for Linux"
arch=('x86_64')
url="https://github.com/rursache/PenguinSnap"
license=('MIT')
depends=('qt6-base' 'qt6-wayland' 'kstatusnotifieritem' 'kglobalaccel' 'layer-shell-qt' 'tesseract' 'tesseract-data-eng' 'spectacle' 'wl-clipboard')
makedepends=('cmake' 'extra-cmake-modules' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/rursache/PenguinSnap/tar.gz/v${pkgver}")
sha256sums=('5369e33d0085c39d7ab87717e5b069b2a6934b81672463ce833b45f2bd16ca7b')

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
