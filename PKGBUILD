# Maintainer:
# Contributor: Tom van der Lee <t0m.vd.l33@gmail.com>

pkgname=bir-git
pkgver=2.0.r2.gcc32901
pkgrel=1
pkgdesc="Simple graphical batch image resizer - git version"
arch=('i686' 'x86_64')
url="https://github.com/agronick/BIR"
license=('custom:WTFPL')
depends=('qt5-base')
makedepends=('git')
conflicts=('bir')
provides=('bir')
source=("git+https://github.com/agronick/BIR.git")
sha256sums=('SKIP')

pkgver() {
  cd BIR
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  qmake-qt5 ../BIR
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 ../BIR/bir.png "$pkgdir"/usr/share/pixmaps/bir.png
  install -Dm644 ../BIR/bir.desktop "$pkgdir"/usr/share/applications/bir.desktop
  install -Dm644 ../BIR/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
