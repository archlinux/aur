# Maintainer: Jason Scurtu <code@xarbit.dev>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
#
# Release-candidate AUR package. CI renders 1.9.0_rc.6 / v1.9.0-rc.6 / 3dd0b515b0fe7839d8780b3b38b7510f6913a5e838ae82660186c10b79a512cf
# via envsubst and pushes the result to the AUR on every -rc tag — see
# .github/workflows/publish.yml. Edit this template, not the AUR repo.
pkgname=plasma6-applets-appgrid-rc
pkgver=1.9.0_rc.6
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
    'kglobalaccel'
    'kcmutils'
    'libplasma'
    'plasma-activities-stats'
    'appstream-qt'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
_tag=v1.9.0-rc.6
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xarbit/plasma6-applet-appgrid/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('3dd0b515b0fe7839d8780b3b38b7510f6913a5e838ae82660186c10b79a512cf')

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
