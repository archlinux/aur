# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=yolo-mark-git
pkgver=r64.ea049f3
pkgrel=1
pkgdesc='GUI for marking bounded boxes of objects in images for training YOLO
neural networks.'
arch=('i686' 'x86_64')
url='https://github.com/AlexeyAB/yolo_mark'
license=('None')
depends=('opencv')
optdepends=()
makedepends=('cmake' 'git' 'vtk')
_name=yolo_mark
provides=('yolo-mark')
source=("git+https://github.com/AlexeyAB/yolo_mark.git")
md5sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Creating build directory
  cd "${srcdir}/${_name}/"
  mkdir -p "build"
  cd "build"

  msg "Starting CMake"

  cmake .. \
    -DCMAKE_PREFIX_PATH='/usr' \
    -DCMAKE_INSTALL_PREFIX='/usr'

  msg "Building the project"
  make
}

package() {
  msg "Installing files"

  #cd "${srcdir}/${_name}/build/"
  #make install

  # Create usr directory
  mkdir $pkgdir/usr

  # bin
  mkdir $pkgdir/usr/bin
  cp $srcdir/${_name}/build/yolo_mark $pkgdir/usr/bin

  chown -R root:root $pkgdir/usr
  chmod -R 755 $pkgdir/usr
}
