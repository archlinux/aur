# Maintainer: Katoitalia

pkgname=deepin-draw-git
pkgver=5.8.0.73
pkgrel=1
arch=(x86_64)
pkgdesc="Draw is a lightweight drawing tool for users to freely draw and simply edit images developed by Deepin Technology."
url="https://github.com/linuxdeepin/deepin-draw"
license=('GPL3')
depends=("qt5-base" "deepin-notifications")
makedepends=("cmake" "git" "qt5-tools")
conflicts=("deepin-draw")
provides=("deepin-draw-git=$pkgver")
source=("$pkgname::git+https://github.com/linuxdeepin/deepin-draw.git")
md5sums=("SKIP")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd $srcdir/$pkgname

  mkdir -p build; cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_CONFIG_NAME=$pkgver ..

  make -j$(($(nproc)+1))
}

package(){

cd $srcdir/$pkgname/build
make install DESTDIR="$pkgdir"
}
