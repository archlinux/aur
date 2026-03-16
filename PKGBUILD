# Maintainer: Jason Scurtu <jscurtu@gmail.com>
pkgname=plasma6-applets-appgrid
pkgver=1.2.2
pkgrel=1
pkgdesc="A modern fullscreen application launcher for KDE Plasma"
arch=('x86_64')
url="https://github.com/xarbit/plasma6-applet-appgrid"
license=('GPL-2.0-or-later')
depends=(
    'plasma-workspace'
    'kservice'
    'ki18n'
    'layer-shell-qt'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'qt6-base'
    'qt6-declarative'
    'libplasma'
    'kpackage'
    'kio'
    'kcoreaddons'
    'kwindowsystem'
    'gettext'
)
provides=('appgrid')
conflicts=('appgrid')
replaces=('appgrid')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xarbit/plasma6-applet-appgrid/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('74d659a84b561ce0133f512ef0a5cb3a31db225561c2a4c46d78555ae2ed5e72')

build() {
    cmake -B build -S "plasma6-applet-appgrid-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
