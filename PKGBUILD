# Maintainer: Jason Scurtu <code@xarbit.dev>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
#
# Canonical AUR PKGBUILD. CI renders 1.8.0 / bf6057aa2744b108ba6ad2f0867b594170ffe3862ad369d7b410d4c852b77ab5 via envsubst
# and pushes the result to the AUR on every stable release — see
# .github/workflows/publish.yml. Edit this template, not the AUR repo.
pkgname=plasma6-applets-appgrid
pkgver=1.8.0
pkgrel=1
pkgdesc="A modern application launcher for KDE Plasma"
arch=('x86_64')
url="https://appgrid.xarbit.dev"
license=('GPL-2.0-or-later')
depends=(
    'plasma-workspace'
    'kservice'
    'layer-shell-qt'
    'qt6-base'
    'kirigami'
    'kiconthemes'
    'ksvg'
    'glibc'
    'kio'
    'krunner'
    'kdeclarative'
    'qt6-declarative'
    'libstdc++'
    'libgcc'
    'kcoreaddons'
    'kwindowsystem'
    'kcmutils'
    'libplasma'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xarbit/plasma6-applet-appgrid/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bf6057aa2744b108ba6ad2f0867b594170ffe3862ad369d7b410d4c852b77ab5')

build() {
    cmake -B build -S "plasma6-applet-appgrid-${pkgver}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAPPGRID_VERSION_OVERRIDE="${pkgver}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
