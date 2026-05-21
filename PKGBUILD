# Maintainer: Jason Scurtu <code@xarbit.dev>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
#
# Release-candidate AUR package. CI renders 1.8.0_rc.4 / v1.8.0-rc.4 / 42da2f496fbc54044a73466d4169ff1f6c5dd51987b56373a136c1ffe03d742d
# via envsubst and pushes the result to the AUR on every -rc tag — see
# .github/workflows/publish.yml. Edit this template, not the AUR repo.
pkgname=plasma6-applets-appgrid-rc
pkgver=1.8.0_rc.4
pkgrel=1
pkgdesc="A modern fullscreen application launcher for KDE Plasma (release candidate)"
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
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
_tag=v1.8.0-rc.4
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xarbit/plasma6-applet-appgrid/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('42da2f496fbc54044a73466d4169ff1f6c5dd51987b56373a136c1ffe03d742d')

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
