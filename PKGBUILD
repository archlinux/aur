# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: 2026 Krema Contributors

pkgname=krema
pkgver=0.1.0
pkgrel=1
pkgdesc='Latte Dock replacement for KDE Plasma 6'
arch=('x86_64' 'aarch64')
url='https://github.com/user/krema'
license=('GPL-3.0-or-later')
depends=(
    'qt6-base>=6.6'
    'qt6-declarative>=6.6'
    'qt6-wayland'
    'kwindowsystem>=6.0'
    'kconfig>=6.0'
    'kcoreaddons>=6.0'
    'ki18n>=6.0'
    'layer-shell-qt>=6.0'
    'wayland>=1.22'
)
makedepends=(
    'cmake>=3.22'
    'ninja'
    'extra-cmake-modules>=6.0'
    'gcc>=14'
)
source=("$pkgname-$pkgver.tar.xz")
sha256sums=('SKIP')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
