# Maintainer: Robin Broda <robin at broda dot me>

_pkgbase=indicator-sysmonitor
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgbase}-budgie-git" "${_pkgbase}-appindicator-git")
pkgver=r90.f5f5f6f
pkgrel=7
pkgdesc='A configurable system monitoring applet'
arch=('any')
url='https://github.com/fossfreedom/indicator-sysmonitor'
license=('GPL3')
conflicts=('indicator-sysmonitor')
provides=('indicator-sysmonitor')
depends=('python' 'python-psutil')
makedepends=('git' 'libappindicator-gtk3')
source=('git+https://github.com/fossfreedom/indicator-sysmonitor.git'
        'https://github.com/fossfreedom/indicator-sysmonitor/pull/80.patch')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgbase}"

  patch Makefile "${srcdir}/80.patch"
}

package_indicator-sysmonitor-budgie-git() {
  cd "${_pkgbase}"
  make DESTDIR="${pkgdir}" installbudgie
}

package_indicator-sysmonitor-appindicator-git() {
  depends+=('libappindicator-gtk3')
  cd "${_pkgbase}"
  make DESTDIR="${pkgdir}" install
}
