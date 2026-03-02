# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: 2026 Krema Contributors

pkgname=krema
pkgver=0.6.0
pkgrel=1
pkgdesc='A lightweight dock for KDE Plasma 6 — spiritual successor to Latte Dock'
arch=('x86_64' 'aarch64')
url='https://github.com/isac322/krema'
license=('GPL-3.0-or-later')
depends=(
    'qt6-base>=6.8'
    'qt6-declarative>=6.8'
    'qt6-wayland'
    'kwindowsystem>=6.0'
    'kconfig>=6.0'
    'kcoreaddons>=6.0'
    'kdbusaddons>=6.0'
    'ki18n>=6.0'
    'kglobalaccel>=6.0'
    'kcolorscheme>=6.0'
    'kiconthemes>=6.0'
    'kcrash>=6.0'
    'kxmlgui>=6.0'
    'kservice>=6.0'
    'kirigami>=6.0'
    'kirigami-addons'
    'layer-shell-qt>=6.0'
    'plasma-workspace'
    'kpipewire'
    'pipewire'
    'wayland>=1.22'
)
makedepends=(
    'cmake>=3.22'
    'ninja'
    'extra-cmake-modules>=6.0'
    'gcc>=14'
    'qt6-shadertools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/isac322/krema/archive/v$pkgver.tar.gz")
sha256sums=('8158ffcc2c27716800d84a3647b9d832ef821eb2e3388ad1526cc49c456283e8')

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
