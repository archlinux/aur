# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=libsmu-git
pkgver=1.0.1.r18.gdda38f6
pkgrel=1
pkgdesc="Software abstractions for the analog signal exploration tools."
arch=('i686' 'x86_64')
url="https://github.com/analogdevicesinc/libsmu"
license=('BSD')
depends=('libusb' 'python2')
makedepends=('git' 'cmake' 'pkg-config')
source=("$pkgname::git+https://github.com/analogdevicesinc/libsmu.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname

  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..

  make
}

package() {
  cd $pkgname

  # Install the license
  install -d "$pkgdir"/usr/share/licenses/libsmu-git/
  install -m 644 LICENSE "$pkgdir"/usr/share/licenses/libsmu-git/

  # Install the library
  cd build
  make DESTDIR="$pkgdir/" install
}
