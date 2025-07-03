# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-control-center-git
_pkgname=deepin-control-center
sourcename=dde-control-center
pkgver=6.1.33.r0.gc944ab000
pkgrel=1
pkgdesc='New control center for linux deepin'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-control-center"
license=('GPL3')
depends=(
    'deepin-account-faces'
    'libpwquality'
    'deepin-daemon'
    'deepin-qt-dbus-factory'
    'deepin-pw-check'
    'qt6-wayland'
    'dtk6core'
    'dtk6widget'
    'dtk6gui'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'qt6-tools'
    'qt6-base'
    'qt6-multimedia'
    'qt6-svg'
    'dtkcommon'
    'gtest'
    'gmock'
)
optdepends=('redshift: automatic color temperature support'
            'networkmanager-openconnect: for OpenConnect support'
            'networkmanager-openvpn: for OpenVPN support'
            'networkmanager-pptp: for PPTP support'
            'networkmanager-strongswan: for StrongSwan support'
            'networkmanager-vpnc: for VPNC support'
            'network-manager-sstp: for SSTP support'
            'deepin-network-core'
)
# Not packaged: network-manager-l2tp
conflicts=('deepin-control-center')
provides=('deepin-control-center')
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/dde-control-center/")
sha512sums=('SKIP')

pkgver() {
    cd $sourcename
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $sourcename
  cmake -B build -GNinja \
      -DDISABLE_SYS_UPDATE=YES \
      -DDISABLE_AUTHENTICATION=YES \
      -DDISABLE_PRIVACY_PLUGIN=YES \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  cd $sourcename/build
  DESTDIR="$pkgdir" ninja install
}
