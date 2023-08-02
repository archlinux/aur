_pkgname=orbita
pkgname=orbita-sim-git
pkgver=r31.6143899
pkgrel=1
pkgdesc="Simulate and visualize orbits of solar system bodies such as planets, comets and asteroids"
arch=(x86_64)
url="https://github.com/tstibor/orbita"
license=(GPL3)
makedepends=('libnova' 'qt6-base')
source=("git+https://github.com/tstibor/orbita.git")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}
  [[ -d build ]] && rm -rf build

  cmake \
    -S "${_pkgname}" \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=NO 
  cmake --build build
}

package() {
  cd "${srcdir}/build"
  DESTDIR="$pkgdir" cmake -P cmake_install.cmake
}
