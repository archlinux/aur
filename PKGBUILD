# Maintainer: Felix Salfelder

_pkgname=gnucap-modelgen-verilog
pkgname=$_pkgname-git
pkgver=r546.3f1daa9
pkgrel=1
pkgdesc="Verilog model generator for Gnucap"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('gnucap')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://git.sv.gnu.org/gnucap/gnucap-modelgen-verilog.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr
  make CXXFLAGS+="-Wno-error=format-security"
}

check() {
  cd $_pkgname
  make check 
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
}

