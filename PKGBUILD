# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=plasma-applet-server-status
pkgname=plasma5-applets-server-status-git
pkgver=r1.7c6d633
pkgrel=1
pkgdesc="Applet for KDE Plasma 5 showing a status of the servers defined by user."
arch=("any")
url="https://github.com/MakG10/plasma-applet-server-status"
license=('unknown')
depends=('')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'plasma-framework')
provides=("plasma5-applets-server-status")
conflicts=("plasma5-applets-server-status")
source=('git+https://github.com/MakG10/plasma-applet-server-status.git' 'cmake.patch')
sha512sums=('SKIP'
            'b9faa2495353977159ec87267c47f45252b32aa0510fc23c2fb18427d74513cce95022110ac4bc3d911f25931eb3b32fd71ba2e545069b41f0b5a8a5c2ed0ab5')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$_pkgname
  patch -Np1 < $srcdir/cmake.patch
}

build() {
  cd $srcdir/$_pkgname
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir/" install
}
