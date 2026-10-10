# Maintainer: awaae001 <awaae001 at qq dot com>

pkgname=fcitx5-input-counter
pkgver=0.3.1
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
sha256sums=('7081e582ba4efb8e74414687b1092d5b2165430c57d2ec83f90e0278e6f05e8d')

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
