# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=2.4.0
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_github='https://github.com/equeim/tremotesf2'
url="${_github}"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base' 'kwidgetsaddons' 'kwindowsystem' 'fmt' 'hicolor-icon-theme' 'libpsl')
makedepends=('qt5-tools' 'cmake' 'ninja' 'gettext' 'cxxopts' 'pkgconf')
source=("${_github}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.zst")

sha256sums=('bb36aae53527f5ef1ded12d12dfb83c6be39e2bfbc7a0c9dcde5275fbb3dbe4f')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
