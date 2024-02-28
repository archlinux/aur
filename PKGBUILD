# Maintainer: Nick G. <wirlaburla@worlio.com>

pkgname=trakker-git
pkgver=0.5.1.r2.gb57095e
pkgrel=1
pkgdesc='A terminal-based tracker interface for libxmp.'
arch=('x86_64')
url='https://git.worlio.com/Wirlaburla/trakker'
license=('GPL3')
depends=('alsa-lib' 'libxmp' 'ncurses')
makedepends=('git' 'cmake')
provides=('trakker')
conflicts=('trakker')
source=("$pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
}

build() {
  cd $pkgname
  mkdir -p build; cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
}

package() {
  cd $pkgname/build
  make install DESTDIR="$pkgdir"
}
