# Maintainer: Lael Guillemenot <zeppelinlg@gmail.com>

pkgname=indicator-sysmonitor-bzr
pkgver=0.4.1
pkgrel=4
pkgdesc="Show cpu and memory usage and also various temperature sensors."
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-sysmonitor"
license=('GPL')
depends=('libindicator3' 'python2-psutil' 'python' 'bzr')
makedepends=()
optdepends=('lm_sensors' 'gnu-netcat' 'hddtemp')
source=(python2.patch)
md5sums=('fcaed89339fe394ddbcc161157fdb490')

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

  patch -p1 < "$srcdir/python2.patch"
}

package() {
  cd ${srcdir}/${_bzrmod}
  install -Dm755 ${srcdir}/${_bzrmod}/indicator-sysmonitor \
          ${pkgdir}/usr/bin/indicator-sysmonitor

  install -Dm644 ${srcdir}/${_bzrmod}/indicator-sysmonitor.desktop \
          ${pkgdir}/usr/share/applications/indicator-sysmonitor.desktop
}
