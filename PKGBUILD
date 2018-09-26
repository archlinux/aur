# Maintainer: Dennis Twardowsky <aur@devpty.de>
_pkgname=noson-app
pkgname="${_pkgname}-git"
pkgver=3.9.0.r0.g2245b7a
pkgrel=1
pkgdesc="SONOS controller for Linux platforms"
arch=('x86_64')
url="https://janbar.github.io/noson-app"
license=('GPL3')
groups=('base-devel')
depends=('cmake' 'qt5-base' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+git://github.com/janbar/noson-app.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake "$srcdir/${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}

