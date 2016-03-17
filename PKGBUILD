# Contributer: Donald Carr <sirspudd@gmail.com>

set -e

_pi_ver=3
pkgname="pi-compositor"
pkgver=0.0.3
pkgrel=1
provides=("pi-launcher")
conflicts=("pi-launcher")
replaces=("pi-launcher")
pkgdesc="Rudimentary QML compositor branched off qtwayland/examples/wayland/qml-compositor "
arch=("any")
url="http://www.qt.io"
license=("LGPL3" "GPL3")
makedepends=("qt-sdk-raspberry-pi${_pi_ver}")
depends=("qt-sdk-raspberry-pi-target-libs")
source=("git://github.com/sirspudd/${pkgname}.git")
sha256sums=("SKIP")
options=('!strip')

build() {
  local repo_src=${srcdir}/${pkgname}
  local qmake=/opt/qt-sdk-raspberry-pi${_pi_ver}/bin/qmake

  cd ${repo_src}
  $qmake
  make
}

package() {
  local repo_src=${srcdir}/${pkgname}
  local deploy_path=${pkgdir}/opt/pi-compositor
  local systemd_deploy_path=${pkgdir}/usr/lib/systemd/system

  mkdir -p $deploy_path
  mkdir -p $systemd_deploy_path

  cp ${repo_src}/${pkgname} ${deploy_path}
  cp ${startdir}/*.service ${systemd_deploy_path}
}
