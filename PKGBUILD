pkgname=piscesys-screenlocker-git
_pkgname=piscesys-screenlocker
pkgver=0.9
pkgrel=1
pkgdesc="piscesys system screen locker"
arch=('x86_64')
url="https://gitlab.com/piscesys/screenlocker"
license=('GPL')
depends=('piscesys-fishui-git' 'libpiscesys-git')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "cutefish-screenlocker-git")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd screenlocker
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd screenlocker
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd screenlocker
  make DESTDIR="$pkgdir" install
}
