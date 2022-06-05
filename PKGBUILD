# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Evert Vorster <evorster@gmail.com>

pkgname=vegastrike-engine
pkgver=0.8.0
pkgrel=1
pkgdesc="A spaceflight simulator in massive universe"
arch=(x86_64)
url="https://www.vega-strike.org/"
license=(GPL2)
depends=(boost-libs python freeglut gtk3 libvorbis openal sdl glu)
makedepends=(git cmake boost)
source=("git+https://github.com/vegastrike/Vega-Strike-Engine-Source#tag=v${pkgver}")
sha256sums=('SKIP')

prepare(){
  cd "${srcdir}/Vega-Strike-Engine-Source/engine"
  mkdir -p build
}

build(){
  cd "${srcdir}/Vega-Strike-Engine-Source/engine/build"
#buildtype none will fail the build, python error
  cmake .. -Wno-dev \
	-DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_PIE=ON 
  make
}

package() {
  cd "${srcdir}/Vega-Strike-Engine-Source/engine/"
  make -C build DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/lib
}
