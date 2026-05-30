# Maintainer: Homer Xing <homer dot hsing at gmail dot com>
# Contributor: Robin Broda <robin at broda dot me>

_pkgbase=indicator-sysmonitor
pkgbase="${_pkgbase}-no-budgie-git"
pkgname=("${_pkgbase}-no-budgie-git")
pkgver=r144.08f8386
pkgrel=1
epoch=
pkgdesc='An Application Indicator showing various system parameters'
arch=('any')
url='https://github.com/fossfreedom/indicator-sysmonitor'
license=('GPL-3.0-or-later')
groups=()
depends=('curl' 'python-gobject' 'python-psutil' 'libayatana-appindicator')
makedepends=('git' 'meson')
checkdepends=()
optdepends=()
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

package() {
  conflicts+=('indicator-sysmonitor-appindicator')
  provides+=('indicator-sysmonitor-appindicator')

  cd "${_pkgbase}"

  rm -rf build
  mkdir build
  cd build
  meson --prefix=/usr
  meson install --destdir "${pkgdir}"
  cd ..

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  python -m compileall -d '/' "${pkgdir}/"
  python -O -m compileall -d '/' "${pkgdir}/"
}
