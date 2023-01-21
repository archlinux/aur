pkgname=piscesys-icons-git
_pkgname=piscesys-icons
pkgver=0.9
pkgrel=1
pkgdesc="System default icon theme of piscesys"
arch=('any')
url="https://gitlab.com/piscesys/icons"
license=('GPL')
depends=()
makedepends=('extra-cmake-modules'  'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "cutefish-icons-git")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd icons
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd icons

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd icons
  DESTDIR="$pkgdir" make install
}
