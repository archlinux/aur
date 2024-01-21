# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-control-center-git
_pkgname=deepin-control-center
sourcename=dde-control-center
pkgver=6.0.40.r1.gf8b4814d0
pkgrel=1
pkgdesc='New control center for linux deepin'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-control-center"
license=('GPL3')
depends=(
    'dtkwidget'
    'deepin-account-faces'
    'libpwquality'
    'startdde'
    'deepin-daemon'
    'deepin-qt-dbus-factory'
    'deepin-pw-check'
    'qt5-wayland'
    'dtkcore'
    'dtkwidget'
    'dtkgui'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'qt5-tools'
    'qt5-base'
    'qt5-x11extras'
    'qt5-multimedia'
    'qt5-svg'
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
  cmake -B build -GNinja -DDISABLE_SYS_UPDATE=YES \
                -DDISABLE_RECOVERY=YES \
                -DDISABLE_ACTIVATOR=YES \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_INSTALL_LIBDIR=/usr/lib \
                -DDISABLE_AUTHENTICATION=ON
  cmake --build build
}

package() {
  cd $sourcename/build
  DESTDIR="$pkgdir" ninja install
}
