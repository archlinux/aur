# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-dockbarx-plugin
pkgname=$_pkgname-gtk3-git
pkgver=54.db059fd
pkgrel=1
pkgdesc="Embed DockbarX in the xfce4-panel"
arch=('i686' 'x86_64')
url="https://github.com/TiZ-EX1/xfce4-dockbarx-plugin"
license=('X11')
depends=('dockbarx>=0.91' 'xfce4-panel')
makedepends=('python2' 'git' 'vala')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/twa022/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git rev-list --count master).$(git rev-parse --short master)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  PREFIX=/usr python2 ./waf configure
  python2 ./waf build
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" python2 ./waf install
}

