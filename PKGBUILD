# Maintainer: Lael Guillemenot <zeppelinlg@gmail.com>

pkgname=indicator-sysmonitor-bzr
pkgver=0.8.1
pkgrel=0
pkgdesc="Show cpu and memory usage and also various temperature sensors."
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-sysmonitor"
license=('GPL')
depends=('libindicator3' 'python2-psutil' 'python' 'bzr')
makedepends=()
optdepends=('lm_sensors' 'gnu-netcat' 'hddtemp')

_bzrbranch=lp:indicator-sysmonitor
_bzrmod=indicator-sysmonitor

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrbranch} ${_bzrmod}
  else
    bzr up ${_bzrmod}
  fi
}

package() {
  cd ${srcdir}/${_bzrmod}
  install -Dm755 ${srcdir}/${_bzrmod}/indicator-sysmonitor \
          ${pkgdir}/usr/bin/indicator-sysmonitor

  install -Dm644 ${srcdir}/${_bzrmod}/indicator-sysmonitor.desktop \
          ${pkgdir}/usr/share/applications/indicator-sysmonitor.desktop
}
