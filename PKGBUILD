# Maintainer: robinpie <robin413@protonmail.com>
pkgname=localquens
pkgver=1.0.0
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
    'qt6-svg'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
_srcname=Localquens
source=("$pkgname-$pkgver.tar.gz::https://github.com/robinpie/$_srcname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('10bc40e57c293606b7d020a3578d18887a95742b15984e46084c2ea9cd2db0a7')

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
