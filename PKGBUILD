pkgname=piscesys-dock-git
_pkgname=piscesys-dock
pkgver=0.9
pkgrel=1
pkgdesc="piscesys application dock"
arch=('x86_64')
url="https://gitlab.com/piscesys/dock"
license=('GPL')
depends=('piscesys-fishui-git' 'libpiscesys-git' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "cutefish-dock-git")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd dock
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd dock

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd dock
  make DESTDIR="$pkgdir" install
}
