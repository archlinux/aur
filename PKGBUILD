# Maintainer: F_TD5X <mjikop1231@gmail.com> 
pkgname=rkmpp-git
pkgver=2024.08.07
pkgrel=1
pkgdesc="Rockchip Media Processing Platform"
arch=('aarch64')
url="https://github.com/nyanmisaka/mpp"
license=('GPL3')
depends=('libdrm')
makedepends=('cmake' 'ninja')

source=("git+https://github.com/nyanmisaka/mpp.git#branch=jellyfin-mpp")
md5sums=('SKIP')

build() {
  cd "$srcdir/mpp"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DBUILD_TEST=OFF ..
  make -j$(nproc)
}

package() {
  cd "$srcdir/mpp/build"
  make DESTDIR="$pkgdir" install
}

