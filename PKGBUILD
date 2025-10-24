# Maintainer: Jerzy Kołosowski <jerzy@kolosowscy.pl>

pkgname=kdisplay-presets
pkgver=1.0.3
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
    'plasma-workspace'
    'libkscreen'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'ninja'
    'git'
)
source=("git+https://github.com/jkolo/kdisplay-presets.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cmake -B build -S "$pkgname" -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF

    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
