# Davide Depau <davide@depau.eu>

_pkgname=ydotool
pkgname=$_pkgname-git
pkgver=v0.2.0.r11.gb1d041f
pkgrel=1
pkgdesc="Generic command-line automation tool (no X!), works on Wayland"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'pentium4')
depends=('boost-libs')
makedepends=('cmake' 'git' 'make' 'pkg-config' 'scdoc')
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
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_MANDIR=/usr/share/man \
    -DCMAKE_BUILD_TYPE=Release \
    -DSTATIC_BUILD=0
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" install -C build/
}
