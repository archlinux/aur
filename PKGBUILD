# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=isoimagewriter
pkgname=$_pkgname-git
pkgver=0.1.r3.g50219e1
pkgrel=1
pkgdesc="A program to write hybrid ISO files onto a USB disk from Linux, Mac or Windows ready to boot."
arch=("x86_64" "i686")
url="https://community.kde.org/ISOImageWriter"
license=('GPL3')
depends=('ki18n' 'kauth' 'qgpgme')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://anongit.kde.org/isoimagewriter.git)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
