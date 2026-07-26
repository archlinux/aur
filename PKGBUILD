# Maintainer: awaae001 <awaae001 at qq dot com>

pkgname=pinclip
pkgver=0.1.2
pkgrel=1
pkgdesc='Pin clipboard text or images as always-on-top desktop notes'
arch=('x86_64')
url='https://git.neosora.cc/awaae001/pinclip'
license=('GPL-3.0-or-later')
depends=(
    'kglobalaccel'
    'kglobalacceld'
    'kwindowsystem'
    'qt6-base'
)
makedepends=('cmake')
optdepends=(
    'wl-clipboard: clipboard fallback under Wayland'
    'xclip: clipboard fallback under X11'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('dfa5edc1f9f741c329189c58c73fd67d8a9d500ad810945045ec58eb6ff394c9')

build() {
    cmake \
        -S pinclip \
        -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DSYSTEMD_USER_UNIT_DIR=/usr/lib/systemd/user
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
