# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=pixelpulse2-git
pkgver=0.87.r0.g942c4ae
pkgrel=1
pkgdesc="A user interface for analog systems exploration."
arch=('i686' 'x86_64')
url="https://github.com/analogdevicesinc/Pixelpulse2"
license=('custom:MPLv2')
depends=('libusb' 'qt5-declarative')
makedepends=('git')
source=("$pkgname::git+https://github.com/analogdevicesinc/Pixelpulse2.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  git submodule update --init
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  qmake-qt5 ..
  make
}

package() {
  # Install the license
  cd $pkgname
  install -d "$pkgdir"/usr/share/licenses/pixelpulse2-git/
  install -m 644 LICENSE "$pkgdir"/usr/share/licenses/pixelpulse2-git/

  # Install the executable
  cd build
  install -d "$pkgdir"/usr/bin/
  install -m 755 pixelpulse2 "$pkgdir"/usr/bin/
}
