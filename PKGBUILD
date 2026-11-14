# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname='pavucontrol-qt'
pkgname="${_pkgname}-git"
pkgver=2.5.1.r1.g8006d3e
pkgrel=2
pkgdesc='Qt port of pavucontrol'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/lxqt/${_pkgname}"
license=('GPL-2.0-only')
depends=('libpulse' 'qt6-base')
optdepends=('pulseaudio: Use PulseAudio server running on the same host as pavucontrol-qt.')
makedepends=('git' 'cmake' 'qt6-tools' 'lxqt-build-tools-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
  rm -Rf build && mkdir build
  cd build
  cmake ../${_pkgname} \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
