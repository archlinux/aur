# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-core-git
_pkgname=cutefish-core
pkgver=0.8.r2.gfae9c3b
pkgrel=1
pkgdesc="System components and backend of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/core"
license=('GPL')
groups=('cutefish-git')
depends=('fishui-git' 'libcutefish-git' 'qt5-quickcontrols2' 'libpulse' 'libxcursor' 'libxtst'
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
