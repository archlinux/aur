# Maintainer: awaae001 <awaae001 at qq dot com>

pkgname=pinclip
pkgver=0.1.1
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
sha256sums=('9763166b47651e429611b2d46ac45f58da57ec102c5a3a98cd365a09780328c4')

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
