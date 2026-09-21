# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgname=vengi-voxel
pkgver=0.6.0
pkgrel=1
pkgdesc='voxel editor with animation and scripting support'
arch=(x86_64)
license=('MIT')
url='https://vengi-voxel.github.io/vengi/'
depends=(sdl2 lua)
makedepends=(git make cmake)
source=("git+https://github.com/vengi-voxel/vengi.git#tag=v${pkgver}")
sha256sums=(SKIP)

build() {
  cd vengi
  mkdir build
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DUSE_SANITIZERS=OFF
  cmake --build build
}

package() {
  cd vengi/build
  make DESTDIR="$pkgdir" install
}
