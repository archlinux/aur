# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: sonic414 <kevinjf at live dot in>

pkgname=delaycut-git
pkgver=1.4.3.9.14.g9304813
pkgrel=1
pkgdesc="Delaycut corrects delay and is also able to cut audio files coded ac3, dts, mpa and wav. It's also able to fix CRC errors in ac3 and mpa files. (GIT Version)"
arch=('x86_64')
url='https://github.com/darealshinji/delaycut'
license=('GPL3')
depends=('qt6-base')
makedepends=('git'
             'qt6-tools'
             )
conflicts=('delaycut')
provides=('delaycut')
source=('git+https://github.com/darealshinji/delaycut.git')
sha256sums=('SKIP')

pkgver() {
  cd delaycut
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake6 ../delaycut CONFIG+=Linux
  make
}

package () {
  make -C build INSTALL_ROOT="${pkgdir}" install

  install -Dm644 delaycut/misc/delaycut.desktop "${pkgdir}/usr/share/applications/delaycut.desktop"
  install -Dm644 delaycut/misc/icon.svg "${pkgdir}/usr/share/pixmaps/delaycut.svg"
}
