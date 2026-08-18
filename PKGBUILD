# Maintainer: awaae001 <awaae001 at qq dot com>

pkgname=fcitx5-input-counter
pkgver=0.2.3
pkgrel=1
pkgdesc='Fcitx 5 addon that records character input statistics'
arch=('x86_64')
url='https://github.com/awaae001/fcitx5-input-counter'
license=('MIT')
install=fcitx5-input-counter.install
depends=(
    'fcitx5>=5.1.2'
    'glibc'
    'hicolor-icon-theme'
    'libgcc'
    'libstdc++'
    'qt6-base'
    'sqlite'
)
makedepends=(
    'cmake'
    'gettext'
    'ninja'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6a34a249edf4aa2c2b5ca21e92761c427d8fd7b6c0a6b83502fcc3ac3aa51870')

build() {
    cmake \
        -S "${pkgname}-${pkgver}" \
        -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=ON
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 \
        "${pkgname}-${pkgver}/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
