# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=apriltag
pkgver=3.1.3
pkgrel=1
pkgdesc="AprilTag is a visual fiducial system popular for robotics research."
arch=('x86_64')
url="https://april.eecs.umich.edu/software/apriltag"
license=('BSD')
source=("https://github.com/AprilRobotics/apriltag/archive/v${pkgver}.tar.gz"
        "cmake.patch")
sha256sums=('a46ce9b63297f20423d7954a8cb0a4e409ab32449ceb45245616ad2d4dd61425'
            '04a589f47ce5d7eb194d509a800f77cc30c7cdea1fc17923f015e00753fa9c43')

prepare() {
  mkdir -p "$srcdir/build"

  cd "$srcdir/${pkgname}-${pkgver}"
  patch -Np1 -i "$srcdir/cmake.patch"
}


build() {
  cd "$srcdir/build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "$srcdir/${pkgname}-${pkgver}"
}

package() {
  cd "$srcdir/build"
  make VERBOSE=1 DESTDIR="$pkgdir" install
}
