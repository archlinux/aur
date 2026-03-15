# Maintainer: Jason Scurtu <jscurtu@gmail.com>
pkgname=plasma6-applets-appgrid
pkgver=1.2.1
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
sha256sums=('4c9f8952e5986496a4d7e10b1f48bd73a10a387061941bbb5cf434b4139b2003')

build() {
    cmake -B build -S "plasma6-applet-appgrid-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
