# Maintainer: robinpie <robin413@protonmail.com>
pkgname=localquens
pkgver=1.0.1
pkgrel=1
pkgdesc='Local lorem ipsum text generator (fork of KDE Eloquens)'
arch=(x86_64)
url='https://github.com/robinpie/localquens'
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later' 'BSD-2-Clause' 'CC0-1.0')
depends=(
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'kconfig'
    'kcoreaddons'
    'kdbusaddons'
    'ki18n'
    'kirigami'
    'qt6-base'
    'qt6-declarative'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
_srcname=Localquens
source=("$pkgname-$pkgver.tar.gz::https://github.com/robinpie/$_srcname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('56bec2f55004a285ce205c0cf9a15d02a3ce275ed85659e6f265d9225e17179b')

build() {
    cmake -B build -S "$_srcname-$pkgver" \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$_srcname-$pkgver/LICENSES/BSD-2-Clause.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/BSD-2-Clause.txt"
}
