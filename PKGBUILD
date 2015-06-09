pkgname=kvirc4-git
pkgver=r5091.6942cb0
pkgrel=2
pkgdesc="Qt4 based IRC-Client, compiled with kde4 support - Git Version"
arch=('i686' 'x86_64')
url="http://www.kvirc.net"
license=('GPL')
depends=('qt4' 'glibc' 'openssl' 'zlib' 'kdelibs' 'perl')
makedepends=('cmake' 'git' 'automoc4' 'gettext')
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
  cmake -DCMAKE_INSTALL_PREFIX="$(kde4-config --prefix)" -DWANT_QT4=1
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
