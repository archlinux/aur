# Maintainer: Eike <e.g@wwu.de>
pkgname=tinytiff-git
_pkgname=tinytiff
pkgdesc="A lightweight C/C++ library for reading and writing TIFF files"
pkgver=r82.f13ce29
pkgrel=1
arch=('any')
license=(custom)
url="https://jkriege2.github.io/TinyTIFF"
depends=()
makedepends=('git')
source=("${_pkgname}::git+https://github.com/jkriege2/TinyTIFF")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "${_pkgname}" \
		-DTinyTIFF_BUILD_SHARED_LIBS=ON \
		-DTinyTIFF_BUILD_STATIC_LIBS=OFF \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build --config Release
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
