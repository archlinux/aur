# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-core-git
_pkgname=piscesde-core
pkgver=0.9
pkgrel=1
pkgdesc="System components and backend of piscesDE"
arch=('x86_64')
url="https://github.com/piscesys/core"
license=('GPL')
groups=('piscesde-git')
depends=('piscesde-fishui-git' 'libpiscesde-git' 'qt5-quickcontrols2' 'libpulse' 'libxcursor' 'libxtst'
          'polkit-qt5')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools'  'xf86-input-libinput'
              'xf86-input-synaptics' 'xorg-server-devel' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd core
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd core

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd core
  make DESTDIR="$pkgdir" install
}
