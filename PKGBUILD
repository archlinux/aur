# Maintainer: Homer Xing <homer dot hsing at gmail dot com>
# Contributor: Lael Guillemenot <zeppelinlg at gmail dot com>

pkgname=indicator-sysmonitor-bzr
pkgver=0.8.2
pkgrel=1
pkgdesc="An Application Indicator showing various system parameters (deprecated)"
arch=('any')
url="https://launchpad.net/indicator-sysmonitor"
license=('GPL3')
depends=('libappindicator-gtk3' 'python-psutil' 'python')
makedepends=('breezy' 'python-dulwich')
optdepends=()

_bzrbranch=lp:indicator-sysmonitor
_bzrmod=indicator-sysmonitor

build() {
  cd ${srcdir}
  if [ -e ${_bzrmod} ]; then
    rm -rf ${_bzrmod}
  fi
  bzr co ${_bzrbranch} ${_bzrmod}
}

package() {
  cd ${srcdir}/${_bzrmod}

  make DESTDIR="${pkgdir}" install

  python -m compileall -d '/' "${pkgdir}/"
  python -O -m compileall -d '/' "${pkgdir}/"
}
