# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=2.7.4
pkgrel=2
pkgdesc='Remote GUI for transmission-daemon'
_github='https://github.com/equeim/tremotesf2'
url="${_github}"
arch=('x86_64')
license=('GPL3')
depends=('qt6-base' 'qt6-svg' 'kwidgetsaddons' 'kwindowsystem' 'fmt' 'hicolor-icon-theme' 'libpsl' 'breeze-icons')
makedepends=('qt6-tools' 'cmake' 'ninja' 'gettext' 'cxxopts' 'pkgconf')
source=("${_github}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.zst")

sha256sums=('fa7ade0daffbfd7a38a19a9c23abee565ed722e841c732a8c08786aa1efd9b70')

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
