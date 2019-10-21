# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-dockbarx-plugin
pkgname=$_pkgname-git
pkgver=49.a2dcb66
pkgrel=3
pkgdesc="Embed DockbarX in the xfce4-panel"
arch=('i686' 'x86_64')
url="https://github.com/TiZ-EX1/xfce4-dockbarx-plugin"
license=('X11')
depends=('dockbarx>=0.91' 'xfce4-panel<4.15.0')
makedepends=('python2' 'git' 'vala')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=( ${_pkgname}::git+https://github.com/TiZ-EX1/${_pkgname}.git )
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git rev-list --count master).$(git rev-parse --short master)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  sed -i 's:env python$:&2:' waf wscript
  PREFIX=/usr ./waf configure
  ./waf build
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" ./waf install
}

