# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: 2026 Krema Contributors

pkgname=krema
pkgver=0.9.0
pkgrel=1
pkgdesc='A lightweight dock for KDE Plasma 6 — spiritual successor to Latte Dock'
arch=('x86_64' 'aarch64')
url='https://krema.bhyoo.com/'
license=('GPL-3.0-or-later' 'MIT-CMU')
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
sha256sums=('6dbb0de97339119371e6cb403b0d1e9dca525cdaaf3b78792865ee94c91fa6f3')

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
    # MIT-CMU is not one of Arch's common licenses, so its text must ship.
    install -Dm644 "$pkgname-$pkgver/LICENSES/MIT-CMU.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/MIT-CMU.txt"
}
