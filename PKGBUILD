# Maintainer: Jan Neumann <neum dot ja at gmail dot com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=latte-dock-git
pkgver=0.7.1.r7.gdbbd01a
pkgrel=1
pkgdesc='A dock based on plasma frameworks - git version'
arch=('i686' 'x86_64')
url='https://github.com/psifidotos/Latte-Dock'
license=('GPL')
depends=('plasma-framework' 'plasma-desktop')
optdepends=('libunity: quicklists, counters, and progress bars for apps using libunity')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'python')
conflicts=('latte-dock')
source=("git+"git://anongit.kde.org/latte-dock.git)
sha256sums=('SKIP')

pkgver() {
  cd latte-dock

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd latte-dock

  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
    
  make
}

package() {
  cd latte-dock/build

  make DESTDIR="$pkgdir" install
}
