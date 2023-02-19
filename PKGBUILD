# Maintainer: Jorge Pizarro-Callejas (Jorgicio) <jpizarrocallejas@gmail.com>
pkgname=noise-suppression-for-voice-git
_pkgname=${pkgname%-git}
pkgver=1.03.r2.gc1cf430
pkgrel=1
pkgdesc="A real-time noise suppression plugin for voice"
arch=('x86_64')
url="https://github.com/werman/noise-suppression-for-voice"
source=("$_pkgname"::"git+${url}.git")
license=('GPL3')
depends=('freetype2')
makedepends=('cmake' 'git' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor')
provides=(${_pkgname})
conflicts=(${_pkgname})
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

# vim:set ts=2 sw=2 et:
