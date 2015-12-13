# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=libsmu-git
pkgver=0.87.r0.gc85a022
pkgrel=1
pkgdesc="Software abstractions for the analog signal exploration tools."
arch=('i686' 'x86_64')
url="https://github.com/analogdevicesinc/libsmu"
license=('BSD')
depends=('libusb' 'python2')
makedepends=('git')
source=("$pkgname::git+https://github.com/analogdevicesinc/libsmu.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname

  # Install the license
  install -d "$pkgdir"/usr/share/licenses/libsmu-git/
  install -m 644 LICENSE "$pkgdir"/usr/share/licenses/libsmu-git/

  # Install the library
  install -d "$pkgdir"/usr/lib/
  install -m 755 libsmu.so "$pkgdir"/usr/lib/

  # Install the binary
  install -d "$pkgdir"/usr/bin/
  install -m 755 smu "$pkgdir"/usr/bin/
}
