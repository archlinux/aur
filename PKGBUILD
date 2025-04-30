# Maintainer: Anagastes

pkgname=v4l2ucp-qt5
pkgver=2.0.2
pkgrel=3
pkgdesc="A universal control panel for Video for Linux Two (V4L2) devices (QT5-Fork)"
arch=('x86_64')
url="https://github.com/smunaut/v4l2ucp-qt5"
license=('GPL2')
depends=('qt5-base' 'v4l-utils')
conflicts=('v4l2ucp')
optdepends=('mplayer: video preview')
makedepends=('cmake')
source=("https://github.com/smunaut/v4l2ucp-qt5/archive/2d2f90cb48207fdad6acf24e010cf0e270affbec.tar.gz")
sha512sums=('5ad2dc98f89d27448a2b8046970ae52d16fb386719353fbaad48304fe87b1fd486e397917a8fc3d5f9efcce0b81f1f1e2491ec6ea664f369af61e192e5ff9c9f')

prepare() {
  cd "${pkgname}-2d2f90cb48207fdad6acf24e010cf0e270affbec"
  sed -i 's/cmake_minimum_required(VERSION 2.6)/cmake_minimum_required(VERSION 3.15)/' ./CMakeLists.txt
  mkdir -vp build
}

build() {
  cd "${pkgname}-2d2f90cb48207fdad6acf24e010cf0e270affbec/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make
}

package() {
  cd "${pkgname}-2d2f90cb48207fdad6acf24e010cf0e270affbec/build"
  make DESTDIR="$pkgdir/" install
}
