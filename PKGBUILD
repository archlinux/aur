# Maintainer: Daniel Liland <danielsen2000 at gmail dot com>
pkgname=globjects-git
pkgver=v1.1.0.r147.g1b0ec7be
pkgrel=2
pkgdesc="a cross-platform C++ wrapper for OpenGL API objects."
license=('MIT')
arch=('x86_64')
url="https://github.com/cginternals/globjects"
depends=('glfw' 'glm' 'glbinding')
makedepends=('cmake' 'git')
provides=('globjects')
conflicts=('globjects')
source=("git+https://github.com/cginternals/globjects#commit=1b0ec7bedbc7e49cada7d49af401ecf7eff11bb4" "globjects.patch")
sha256sums=('SKIP'
            'a87527ed097239d3fa0a7e533b63a4b642a39d6434fe977d2ed8f1cbafc14bb8')

pkgver() {
    cd "${srcdir}/globjects"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/globjects"
    patch --forward --strip=1 --input="${srcdir}/globjects.patch"
}

package() {
  cd "${srcdir}/globjects"
  mkdir -p build
  cd build

  cmake -Wno-dev -DOPTION_BUILD_EXAMPLES=OFF -DCMAKE_INSTALL_PREFIX=/usr ..
  make DESTDIR="$pkgdir" install
}

