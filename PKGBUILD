# Maintainer: Nick G. <wirlaburla@worlio.com>

pkgname=trakker-git
pkgver=0.5.2.r3.gf97e506
pkgrel=1
pkgdesc='A terminal-based tracker interface for libxmp.'
arch=('x86_64')
url='https://git.worlio.com/Wirlaburla/trakker'
license=('GPL3')
depends=('alsa-lib' 'libxmp' 'ncurses')
makedepends=('git' 'cmake')
provides=('trakker')
conflicts=('trakker')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install 
}
