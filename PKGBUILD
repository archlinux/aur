# Maintainer: Jason Scurtu <code@xarbit.dev>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
#
# Release-candidate AUR package. CI renders 1.9.0_rc.1 / v1.9.0-rc.1 / 137050368bc8cd9cd691bf5be5d0a2656e06381ba595a082dd8e261730eb531c
# via envsubst and pushes the result to the AUR on every -rc tag — see
# .github/workflows/publish.yml. Edit this template, not the AUR repo.
pkgname=plasma6-applets-appgrid-rc
pkgver=1.9.0_rc.1
pkgrel=1
pkgdesc="A modern application launcher for KDE Plasma (release candidate)"
arch=('x86_64')
url="https://appgrid.xarbit.dev"
license=('GPL-2.0-or-later')
provides=('plasma6-applets-appgrid')
conflicts=('plasma6-applets-appgrid')
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
    'plasma-activities-stats'
    'appstream-qt'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
_tag=v1.9.0-rc.1
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xarbit/plasma6-applet-appgrid/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('137050368bc8cd9cd691bf5be5d0a2656e06381ba595a082dd8e261730eb531c')

build() {
    cmake -B build -S "plasma6-applet-appgrid-${_tag#v}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAPPGRID_VERSION_OVERRIDE="${_tag#v}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
