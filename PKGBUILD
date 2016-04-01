pkgname=kvirc4-git
pkgver=r6345.d6158c4
pkgrel=5
pkgdesc="Qt5 based IRC-Client, compiled with kde4 support - Git Version"
arch=('i686' 'x86_64')
url="http://www.kvirc.net"
license=('GPL')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-x11extras' 'phonon-qt5' 'glibc' 'openssl' 'zlib' 'kdelibs' 'perl')
makedepends=('cmake' 'git' 'automoc4' 'gettext' 'doxygen')
conflicts=('kvirc4' 'kvirc')
provides=('kvirc' 'kvirc4')
source=("kvirc4-git::git+https://github.com/kvirc/KVIrc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX="$(kde4-config --prefix)"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
