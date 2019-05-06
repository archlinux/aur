# Maintainer: Jerry Lin <jerry73204 at gmail dot com>
pkgname=stage-git
pkgver=r2333.0c85412d
pkgrel=1
pkgdesc='Stage is a robot simulator providing a virtual world populated by mobile robots and sensors, along with various objects for the robots to sense and manipulate.'
arch=('i686' 'x86_64')
url="http://rtv.github.io/Stage/"
license=('GPLv2')
depends=('fltk>=1.1' 'libpng' 'libjpeg' 'glu')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('stage::git+https://github.com/rtv/Stage.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make DESTDIR="$pkgdir/" install
}
