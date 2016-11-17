# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=razercfg-git
pkgrel=1
pkgver=0.33.r40.ge50dac1
pkgver() {
  cd razercfg
  git describe --long | sed 's/^razercfg-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
install=razercfg-git.install
pkgdesc='Configuration utility for Razer devices on Linux systems.'
arch=('x86_64' 'i686')
license=('GPLv2')
source=('razercfg::git+https://github.com/mbuesch/razer.git')
url='http://bues.ch/cms/hacking/razercfg.html'
makedepends=('git' 'cmake')
optdepends=('python-pyside: For the graphical qrazercfg tool only.')
depends=('libusb' 'python')
provides=('razercfg' 'razercfg-git')
conflicts=('razercfg' 'razercfg-git')
md5sums=('SKIP')
build() {
  cd razercfg
  if [[ -d CMakeFiles ]]; then
    rm -rf CMakeFiles
  fi
  cmake . -DCMAKE_INSTALL_PREFIX='/usr'
  make
}
package_razercfg-git() {
  cd razercfg
  make DESTDIR="$pkgdir/" install
}
