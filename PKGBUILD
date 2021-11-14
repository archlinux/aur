# Maintainer: robertfoster

pkgname=gnome-pie-git
pkgver=0.7.3.r0.g0140a40
pkgrel=1
pkgdesc="Circular application launcher for GNOME"
arch=('i686' 'x86_64')
url="https://simmesimme.github.io/gnome-pie.html"
license=('MIT')
depends=('libarchive' 'libgee' 'libwnck3' 'gnome-menus')
makedepends=('cmake' 'git' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Simmesimme/gnome-pie")

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  ./resources/locale/compile-po.sh
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/${pkgname%-git}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

sha256sums=('SKIP')
