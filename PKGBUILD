# Davide Depau <davide@depau.eu>

_pkgname=ydotool
pkgname=$_pkgname-git
pkgver=v0.1.8.r13.gfb6ee1f
pkgrel=1
pkgdesc="Generic command-line automation tool (no X!), works on Wayland"
arch=('i686' 'x86_64')
depends=('libevdevplus' 'libuinputplus' 'boost-libs')
makedepends=('cmake' 'git' 'make' 'pkg-config' 'boost')
url="https://github.com/ReimuNotMoe/ydotool"
license=('MIT')
source=(${_pkgname}::git+https://github.com/ReimuNotMoe/ydotool.git)
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"

  mkdir -p build && cd build
  
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" install -C build/
}
