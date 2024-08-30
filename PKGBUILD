# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=2.7.0
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_github='https://github.com/equeim/tremotesf2'
url="${_github}"
arch=('x86_64')
license=('GPL3')
depends=('qt6-base' 'qt6-svg' 'kwidgetsaddons' 'kwindowsystem' 'fmt' 'hicolor-icon-theme' 'libpsl' 'breeze-icons')
makedepends=('qt6-tools' 'cmake' 'ninja' 'gettext' 'cxxopts' 'pkgconf')
source=("${_github}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.zst")

sha256sums=('dbd41d187b8616a74406389fb4a6233c0f8c696d361030ac8986813bfe4dd6b8')

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
