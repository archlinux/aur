# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=2.6.3
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_github='https://github.com/equeim/tremotesf2'
url="${_github}"
arch=('x86_64')
license=('GPL3')
depends=('qt6-base' 'qt6-svg' 'kwidgetsaddons' 'kwindowsystem' 'fmt' 'hicolor-icon-theme' 'libpsl')
makedepends=('qt6-tools' 'cmake' 'ninja' 'gettext' 'cxxopts' 'pkgconf')
source=("${_github}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.zst")

sha256sums=('8b9ce636c40ada1be4707c9ebed5f8e235e21abec73bf1ecf6a95c808bff1e3e')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DTREMOTESF_WITH_HTTPLIB='bundled' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
