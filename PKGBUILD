# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=2.6.1
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_github='https://github.com/equeim/tremotesf2'
url="${_github}"
arch=('x86_64')
license=('GPL3')
depends=('qt6-base' 'kwidgetsaddons' 'kwindowsystem' 'fmt' 'hicolor-icon-theme' 'libpsl')
makedepends=('qt6-tools' 'cmake' 'ninja' 'gettext' 'cxxopts' 'pkgconf')
source=("${_github}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.zst")

sha256sums=('1fe8ca02a843640b52211a2f2a5edeb27eb99816896e86d837127ede939baa03')

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
