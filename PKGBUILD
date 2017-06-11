# Maintainer: Patrick José Pereira <positivcheg94@gmail.com>
pkgname=librealsense
pkgver=c8754286
pkgrel=1
pkgdesc="Librealsense is a cross-platform library (Linux, OSX, Windows) for capturing data from the Intel RealSense F200, SR300 and R200 cameras"
arch=(any)
url="https://github.com/IntelRealSense/librealsense"
license=('Apache')
makedepends=()
depends=('git' 'glfw-x11>=3' 'libusb' 'linux-headers')
optdepends=('qtcreator')
changelog=''
source=("git://github.com/IntelRealSense/librealsense")
md5sums=(SKIP)
udev_rules="etc/udev/rules.d/99-realsense-libusb.rules"

pkgver() {
  cd "$pkgname"
  git log --pretty=format:'%h' -n 1
}

build() {
  cd "$pkgname"
  mkdir build && cd build
  cmake ../ -DBUILD_EXAMPLES=true
  make
}

package() {
  cd "$pkgname/build"
  sudo make install
  echo "Maybe kernel patch be necessary !!"
}
