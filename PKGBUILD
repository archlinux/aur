# Maintainer: Adrian Holfter < aholfter PLUS aur AT googlemail DOT com >
pkgname=laslib-git
pkgver=r165.8b7be7d
pkgrel=1
pkgdesc="LASlib is a C++ programming API for reading / writing LIDAR data stored in standard LAS format."
arch=('i686' 'x86_64')
url="http://lastools.org/"
license=('LGPL')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/LAStools/LAStools.git)
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/LAStools"
  make
}

package() {
  cd "$srcdir/LAStools/LASlib/inc"
  find . -exec install -Dm644 {} "$pkgdir/usr/include/laslib/{}" \;

  cd "$srcdir/LAStools/LASlib/"
  install -Dm644 "$srcdir/LAStools/LASlib/lib/liblas.a" "$pkgdir/usr/lib/liblaslib.a"
}
