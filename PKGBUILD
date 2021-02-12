# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-dockbarx-plugin
pkgname=${_pkgname}-git
epoch=1
_pkgver=0.6
pkgver=0.6+r65+aa9c974
pkgrel=1
pkgdesc="Embed DockbarX in the xfce4-panel"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/m7s/xfce4-dockbarx-plugin"
license=('X11')
depends=('dockbarx>=1.0beta' 'xfce4-panel>=4.12')
makedepends=('git' 'vala')
provides=("${_pkgname}=${pkgver}")
_branch='pygi-python3'
source=("${_pkgname}::git+https://github.com/xuzhen/${_pkgname}#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s+r%s+%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  PREFIX=/usr python ./waf configure
}

build() {
  cd "${srcdir}/${_pkgname}"
  python ./waf build
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" python ./waf install
}

