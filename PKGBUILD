# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=dockbarx-lxqt-plugin
pkgname=${_pkgname}-git
pkgver=0.9.1+0+g763705c
pkgrel=1
pkgdesc="DockBarX LXQT applet"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/xuzhen/dockbarx-lxqt-plugin"
license=('GPL3')
depends=('dockbarx' 'lxqt-panel' 'qt6-base')
makedepends=('cmake' 'git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's:^v::;s:-:+:g'
}

build() {
  cd "${_pkgname}"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}
package() {
  cd "${_pkgname}"/build
  make DESTDIR="${pkgdir}" install
}
