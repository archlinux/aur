# Maintainer: Jerzy Kołosowski <jerzy@kolosowscy.pl>

pkgname=kdisplay-presets
pkgver=1.0.4
pkgrel=2
pkgdesc="Standalone KDE Plasma utility for managing display configuration presets"
arch=('x86_64')
url="https://github.com/jkolo/kdisplay-presets"
license=('GPL-2.0-or-later')
depends=(
    'qt6-base'
    'qt6-declarative'
    'kconfig'
    'kcoreaddons'
    'kdbusaddons'
    'ki18n'
    'kglobalaccel'
    'kcmutils'
    'kxmlgui'
    'plasma-workspace'
    'libkscreen'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'ninja'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jkolo/kdisplay-presets/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8c0b37cde061c81037dc4b2a24577e1b4e4a6904f1798aa8f54660990189e786')

build() {
    cmake -B build -S "$pkgname-$pkgver" -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF

    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
