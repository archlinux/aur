# Maintainer: Ruben Van Boxem <vanboxem.ruben@gmail.com>

pkgname=rkmpp-git
pkgver=r1958.16047eb2
pkgrel=1
pkgdesc="Rockchip Media Process Platform (MPP) module"
arch=('aarch64')
url="https://github.com/rockchip-linux/mpp"
license=('Apache')
makedepends=('cmake' 'git')
provides=('rkmpp')
conflicts=('rkmpp')
source=("git+https://github.com/rockchip-linux/mpp.git")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/mpp"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir
  mkdir -p build
  cd build
        
  cmake ../mpp -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/usr/bin"
}
