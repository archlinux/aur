# Maintainer: John Regan <john@jrjrtech.com>

pkgname=pydio-sync-ui-git
pkgrel=2
pkgver=r125.69a07e0
pkgdesc="Pydio Sync Client - QT5 UI"
arch=('x86_64' 'i686')
url="http://pyd.io"
license=('GPL2')
depends=(
    'qt5-base'
    'pydio-sync-git'
         )
makedepends=('git')
provides=('pydio-sync-ui')
conflicts=('pydio-sync-ui')
source=('git://github.com/pydio/pydio-sync-ui.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/pydio-sync-ui"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/pydio-sync-ui/src/systray"
  # fix path to pydio-agent
  sed -i 's#/../pydio-agent/pydio-agent#/pydio#' globals.h
  qmake
  make
}

package() {
  cd "${srcdir}/pydio-sync-ui"
  install -D -m 755 build/pydio-ui "${pkgdir}/usr/bin/pydio-ui"
}
