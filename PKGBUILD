# Maintainer: robertfoster

pkgname=gnome-pie-git
pkgver=v0.7.2.r2.02e26da
pkgrel=1
pkgdesc="Circular application launcher for GNOME"
arch=('i686' 'x86_64')
url="https://simmesimme.github.io/gnome-pie.html"
license=('MIT')
depends=('libarchive' 'libgee' 'libwnck3' 'gnome-menus')
makedepends=('cmake' 'git' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("gnome-pie::git+https://github.com/Simmesimme/gnome-pie")

build() {
  cd "${srcdir}/${pkgname%-git}"
  ./resources/locale/compile-po.sh
  [[ -d build ]] || mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

sha256sums=('SKIP')
