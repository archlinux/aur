# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=qtermwidget5
_pkgname=qtermwidget
pkgver=1.4.0
pkgrel=1
pkgdesc='A terminal widget for Qt 5, legacy dependency'
arch=('x86_64')
url='https://github.com/lxqt/qtermwidget'
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later' 'BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'qt5-base')
makedepends=('cmake' 'ninja' 'lxqt-build-tools-qt5' 'qt5-tools')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz")
sha256sums=('e7253065f74fa056843c95f9543e690bcaf7a03647ef5e02379eec4eb162026b')

build() {
    cmake -S "$_pkgname-$pkgver" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$_pkgname-$pkgver"/LICENSE{,.LGPL2+,.BSD-3-clause} -t "$pkgdir/usr/share/licenses/$pkgname/"
}
