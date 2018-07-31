# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=smartservoframework-git
pkgver=0.99_235.e129fff
pkgrel=1
pkgdesc="A multi-platform C++ framework used to drive 'smart servo' devices like Dynamixel or HerkuleX actuators."
arch=("armv6h" "i686" "x86_64")
url="https://github.com/emericg/SmartServoFramework"
license=("LGPL3")
makedepends=("git" "cmake")

provides=('smartservoframework')
conflicts=('smartservoframework')

source=("git+https://github.com/emericg/SmartServoFramework.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/SmartServoFramework"
    echo "0.99_$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "SmartServoFramework"
  cd SmartServoFramework/build/

  cmake -DBUILD_STATIC_LIBS:BOOL=OFF -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "SmartServoFramework/build/"
  make DESTDIR="${pkgdir}" install
}

