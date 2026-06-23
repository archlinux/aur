# Maintainer: Jerzy Kołosowski <jerzy@kolosowscy.pl>

pkgname=kdisplay-presets
pkgver=1.1.0
pkgrel=1
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
    'knotifications'
    'plasma-workspace'
    'libplasma'
    'libkscreen'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'ninja'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jkolo/kdisplay-presets/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a4896dc705754370e793aa730474b209536d5698ff361ae5a5dae00bc4517012')

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
