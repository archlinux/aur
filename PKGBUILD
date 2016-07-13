# Maintainer: Thaodan <theodorstormgrade@gmail.com>
_pkgname=telepathy-kdeconnect
pkgname=${_pkgname}-git
pkgver=r4.aa7b689
pkgrel=1
pkgdesc="KDE Connect TelepathyQt-based Connection Manager"
url='https://community.kde.org/KDEConnect'
arch=('i686' 'x86_64')
groups=('telepathy')
license=('LGPL2.1')
depends=('telepathy-qt5')
makedepends=('extra-cmake-modules')
conflicts=($_pkgname)
provides=($_pkgname)
options=('!emptydirs')
source=(git+https://github.com/KDE/telepathy-kdeconnect.git)
md5sums=('SKIP')

pkgver()
{
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
  cd $_pkgname
  mkdir -p build
}
build() {
  cd $_pkgname/build
  cmake ../. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib/telepathy \
        -DCMAKE_INSTALL_PREFIX=/usr 
  
  CXXFLAGS+=" -Wno-error"
  make
}

package() {
  cd $_pkgname/build
  make DESTDIR="$pkgdir" install
}
