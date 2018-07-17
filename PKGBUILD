# Maintainer: Robin Broda <robin at broda dot me>

_pkgbase=indicator-sysmonitor
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgbase}-budgie-git" "${_pkgbase}-appindicator-git")
pkgver=r97.8e10edb
pkgrel=1
pkgdesc='A configurable system monitoring applet'
arch=('any')
url='https://github.com/fossfreedom/indicator-sysmonitor'
license=('GPL3')
conflicts=('indicator-sysmonitor')
provides=('indicator-sysmonitor')
depends=('python' 'python-psutil')
makedepends=('git' 'libappindicator-gtk3')
source=('git+https://github.com/fossfreedom/indicator-sysmonitor.git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_indicator-sysmonitor-budgie-git() {
  pkgdesc+=", budgie-panel version"
  conflicts+=('indicator-sysmonitor-budgie')
  provides+=('indicator-sysmonitor-budgie')

  cd "${_pkgbase}"
  make DESTDIR="${pkgdir}" installbudgie

  python -m compileall -d '/' "${pkgdir}/"
  python -O -m compileall -d '/' "${pkgdir}/"
}

package_indicator-sysmonitor-appindicator-git() {
  pkgdesc+=", appindicator version"
  depends+=('libappindicator-gtk3')
  conflicts+=('indicator-sysmonitor-appindicator')
  provides+=('indicator-sysmonitor-appindicator')

  cd "${_pkgbase}"
  make DESTDIR="${pkgdir}" install

  python -m compileall -d '/' "${pkgdir}/"
  python -O -m compileall -d '/' "${pkgdir}/"
}
