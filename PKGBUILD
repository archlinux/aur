# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-dockbarx-plugin
pkgname=${_pkgname}-git
epoch=1
pkgver=0.7.2+2+g43af2dd
pkgrel=1
pkgdesc="Embed DockbarX in the xfce4-panel (latest git commit)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
#url="https://github.com/m7s/xfce4-dockbarx-plugin"
url="https://github.com/xuzhen/xfce4-dockbarx-plugin"
license=('X11')
depends=('dockbarx>=1.0beta' 'xfce4-panel')
makedepends=('cmake' 'git')
provides=("${_pkgname}=${pkgver}")
_branch='pygi-python3'
source=("${_pkgname}::git+${url}#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's:^v::;s:-:+:g'
}

prepare() {
  cd "${_pkgname}"
  [ -d build ] && rm -fr build
  mkdir build
}

build() {
  cd "${_pkgname}"/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..
  make  
}

package() {
  cd "${_pkgname}"/build
  make DESTDIR="${pkgdir}" install
}

