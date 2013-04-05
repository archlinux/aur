# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=ecrire-git
_pkgname=ecrire
pkgver=0.1.0.83
pkgrel=1
pkgdesc="Simple text editor based on EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('elementary' 'desktop-file-utils')
makedepends=('git' 'cmake')
install=ecrire.install
source=("git://git.enlightenment.org/apps/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  for i in VMAJ VMIN VMIC; do
    local _$i=$(grep -m 1 $i CMakeLists.txt | grep -o "[[:digit:]]*")
  done
  
  echo $_VMAJ.$_VMIN.$_VMIC.$(git rev-list --count HEAD)
}

prepare() {
  cd "$srcdir/$_pkgname"
  
  mv cmake/Modules/legacy/* cmake/Modules/
}

build() {
  cd "$srcdir/$_pkgname"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"
  
  make DESTDIR="$pkgdir" install
}
