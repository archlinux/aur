# Maintainer: Kirill Belousov <cyrmax@internet.ru>
_pkgname=sral
pkgname=lib${_pkgname}
pkgver=0.3
pkgrel=1
pkgdesc="A Screen Reader Abstraction Library"
arch=('x86_64')
url="https://github.com/m1maker/sral"
license=('MIT')
makedepends=('cmake' 'ninja' 'libx11' 'libspeechd') # libx11 will be removed in newer releases but is needed to build this release 
depends=('gcc-libs' 'libspeechd' 'libx11') 
source=("${url}/archive/refs/tags/${pkgver}-Stable.tar.gz")
sha256sums=('31b5e6b43fbeecbe9701dee9fab485ca6090575293562ebeb17e5b8ae30f85b8')

build() {
  cd "${srcdir}/SRAL-${pkgver}-Stable"
local cmake_options=(
-B build
-S .
-G Ninja
-W no-dev
-D CMAKE_BUILD_TYPE=None
-D CMAKE_INSTALL_PREFIX=/usr
	)
cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  cd "${srcdir}/SRAL-${pkgver}-Stable"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
