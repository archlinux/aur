# Maintainer: Marco Wang <m.aesophor@gmail.com>

pkgname=wmderland-git
_pkgname=wmderland
pkgver=1.0.3
pkgrel=1
pkgdesc='X11 tiling window manager using space partitioning trees'
arch=('x86_64')
url="https://github.com/aesophor/wmderland"
license=('MIT')
depends=('libx11')
makedepends=('gcc>=6.0' 'cmake>=3.9')
install=${_pkgname}.install
source=('git://github.com/aesophor/wmderland.git')
sha256sums=('SKIP')

build() {
  cd ${_pkgname}/
  ./build.sh
}

package() {
  # Install wmderland.
  cd ${_pkgname}/build/
  make DESTDIR="${pkgdir}/" PREFIX="/usr/local/" install

  # Install wmderlandc (ipc client).
  cd ../ipc-client/build/
  make DESTDIR="${pkgdir}/" PREFIX="/usr/local/" install

  # Install example config file.
  cd ../../
  mkdir -p "${pkgdir}/etc/xdg/wmderland/"
  install -D -m644 example/* "${pkgdir}/etc/xdg/wmderland/"
}
