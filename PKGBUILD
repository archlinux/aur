# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=2.0.0
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_github='https://github.com/equeim/tremotesf2'
url="${_github}"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base' 'kwidgetsaddons' 'kwindowsystem' 'fmt' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'cmake' 'ninja' 'gettext')
source=("${_github}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('049139ba37f87c25584e05dcdf6e7c244a5b8ac0eaf0fd1507ea908db7220fac')

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
