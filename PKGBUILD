# Maintainer: Brian Thompson <brianrobt@pm.me>

pkgname=openmohaa
pkgver=0.81.1
pkgrel=1
pkgdesc="Open re-implementation of Medal of Honor: Allied Assault "
arch=('i686' 'x86_64')
url="https://github.com/openmoh/openmohaa"
license=('GPL-2.0-only')
depends=(
  'openal'
  'sdl2'
  'openjpeg2'
  'libmad'
  'hicolor-icon-theme'
)
makedepends=(
  'cmake'
  'ninja'
)
_relstage="beta"
options=(!debug !lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openmoh/openmohaa/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3a72a4e4c706459347e3fe4d1cf69930d48979dc8933fe10e2eab08402d5c9b9')

build() {
  cd $pkgname-$pkgver || exit
  [[ -d build ]] && rm -rf build
  mkdir build && cd build || exit

  cmake -G Ninja ../ -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" -DTARGET_LOCAL_SYSTEM=1 -DUSE_SYSTEM_LIBS=0 -DPRODUCT_VERSION_STAGE="${_relstage}"
}

package() {
  cd $pkgname-$pkgver || exit
  ninja -C build install
}
