# Maintainer: Matthias Baur  <aur@matthiasbaur.me>
pkgname=noson-app
pkgver=3.9.4.r0.g816ffa5
pkgrel=1
pkgdesc="The essential to control music from your SONOS devices on Linux platforms"
arch=('x86_64' 'armv7h')
url="https://janbar.github.io/noson-app"
license=('GPL3')
groups=('base-devel')
depends=('cmake' 'qt5-base' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg')
makedepends=('cmake' 'git')
source=("git+git://github.com/janbar/noson-app.git#tag=3.9.4")
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
