# Maintainer: Homer Xing <homer dot hsing at gmail dot com>
# Contributor: Robin Broda <robin at broda dot me>

_pkgbase=indicator-sysmonitor
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgbase}-budgie-git" "${_pkgbase}-appindicator-git")
pkgver=r117.b99cc39
pkgrel=1
pkgdesc='An Application Indicator showing cpu temperature, memory, network speed, cpu usage, public IP address and internet connection status'
arch=('any')
url='https://github.com/fossfreedom/indicator-sysmonitor'
license=('GPL3')
conflicts=('indicator-sysmonitor')
provides=('indicator-sysmonitor')
depends=('curl' 'python-gobject' 'python-psutil')
makedepends=('git')
source=('git+https://github.com/fossfreedom/indicator-sysmonitor.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_indicator-sysmonitor-budgie-git() {
  pkgdesc+="; budgie-panel version"
  depends+=('budgie-desktop')
  conflicts+=('indicator-sysmonitor-budgie')
  provides+=('indicator-sysmonitor-budgie')

  cd "${_pkgbase}"
  make DESTDIR="${pkgdir}" installbudgie

  python -m compileall -d '/' "${pkgdir}/"
  python -O -m compileall -d '/' "${pkgdir}/"
}

package_indicator-sysmonitor-appindicator-git() {
  pkgdesc+="; appindicator version"
  depends+=('libappindicator-gtk3')
  conflicts+=('indicator-sysmonitor-appindicator')
  provides+=('indicator-sysmonitor-appindicator')

  cd "${_pkgbase}"
  make DESTDIR="${pkgdir}" install

  python -m compileall -d '/' "${pkgdir}/"
  python -O -m compileall -d '/' "${pkgdir}/"
}
