# Maintainer: Jorge Pizarro-Callejas (Jorgicio) <jpizarrocallejas@gmail.com>
pkgname=noise-suppression-for-voice-git
_pkgname=${pkgname%-git}
pkgver=v0.91.r8.g6922453
pkgrel=1
pkgdesc="A real-time noise suppression plugin for voice"
arch=('x86_64')
url="https://github.com/werman/noise-suppression-for-voice"
source=('git+https://github.com/werman/noise-suppression-for-voice.git')
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'git')
provides=(${_pkgname})
conflicts=(${_pkgname})

pkgver() {
    cd ${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  mkdir build
}

build() {
  cd ${_pkgname}/build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=None ..
  make
}

package() {
  cd ${_pkgname}/build
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
sha256sums=('SKIP')
