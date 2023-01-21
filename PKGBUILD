pkgname=piscesys-statusbar-git
_pkgname=piscesys-statusbar
pkgver=0.9
pkgrel=1
pkgdesc="Top status bar of piscesys"
arch=('x86_64')
url="https://gitlab.com/piscesys/statusbar"
license=('GPL')
depends=('piscesys-fishui-git' 'libpiscesys-git' 'libdbusmenu-qt5' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "cutefish-statusbar-git")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd statusbar
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd statusbar

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd statusbar
  make DESTDIR="$pkgdir" install
}
