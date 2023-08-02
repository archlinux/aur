_pkgname=skytechx
pkgname=skytechx-git
pkgver=r390.31d588a
pkgrel=1
pkgdesc="SkytechX is free astronomical planetarium for rendering real objects (stars, planets, comets etc.) on the map"
arch=(x86_64)
url="https://github.com/tstibor/skytechx"
license=(GPL)
makedepends=('qt5-multimedia' 'qt5-script' 'qt5-charts')
source=("git+https://github.com/tstibor/skytechx.git")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}
  [[ -d build ]] && rm -rf build

  cmake \
    -S "skytechx" \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=NO 
  cmake --build build
}

package() {
  cd "${srcdir}/build"
  DESTDIR="$pkgdir" cmake -P cmake_install.cmake
}
