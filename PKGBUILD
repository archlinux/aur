# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=razercfg-git
pkgrel=1
pkgver=0.39.r16.gd17e48b
install=razercfg-git.install
pkgdesc='Configuration utility for Razer devices on Linux systems.'
arch=('x86_64' 'i686')
license=('GPL')
source=('razercfg::git+https://github.com/mbuesch/razer.git')
url='http://bues.ch/cms/hacking/razercfg.html'
makedepends=('git' 'cmake')
optdepends=('python-pyqt5: for the graphical qrazercfg tool')
depends=('libusb' 'python')
provides=('razercfg')
conflicts=('razercfg')
md5sums=('SKIP')

pkgver() {
  cd razercfg
  git describe --long | sed 's/^razercfg-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd razercfg
  if [[ -d CMakeFiles ]]; then
    rm -rf CMakeFiles
  fi
  cmake . -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd razercfg
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
