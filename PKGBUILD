# Maintainer: Homer Xing <homer dot hsing at gmail dot com>
# Contributor: Robin Broda <robin at broda dot me>

_pkgbase=indicator-sysmonitor
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgbase}-budgie-git" "${_pkgbase}-appindicator-git")
pkgver=r120.6a4e9f4
pkgrel=2
epoch=
pkgdesc='An Application Indicator showing various system parameters'
arch=('any')
url='https://github.com/fossfreedom/indicator-sysmonitor'
license=('GPL3')
groups=()
depends=('curl' 'python-gobject' 'python-psutil')
makedepends=('git')
checkdepends=()
optdepends=('libayatana-appindicator')
provides=('indicator-sysmonitor')
conflicts=('indicator-sysmonitor')
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/fossfreedom/indicator-sysmonitor.git')
noextract=()
validpgpkeys=()
b2sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_indicator-sysmonitor-budgie-git() {
  pkgdesc+="; budgie-desktop version"
  depends+=('budgie-desktop')
  conflicts+=('indicator-sysmonitor-budgie')
  provides+=('indicator-sysmonitor-budgie')

  cd "${_pkgbase}"
  make DESTDIR="${pkgdir}" installbudgie
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/indicator-sysmonitor-budgie-git/LICENSE"

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
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/indicator-sysmonitor-appindicator-git/LICENSE"

  python -m compileall -d '/' "${pkgdir}/"
  python -O -m compileall -d '/' "${pkgdir}/"
}
