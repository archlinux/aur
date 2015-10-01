pkgname=kvirc-git
pkgver=r5453.f5dc3c4
pkgrel=1
pkgdesc="Qt4 based IRC-Client, compiled with kde4 support - Git Version"
arch=('i686' 'x86_64')
url="http://www.kvirc.net"
license=('GPL')
depends=('qt5-base' 'glibc' 'openssl' 'zlib' 'perl')
makedepends=('cmake' 'git'  'gettext')
conflicts=('kvirc4' 'kvirc')
provides=('kvirc' 'kvirc4')
source=("kvirc-git::git+https://github.com/kvirc/KVIrc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=$(kf5-config --prefix) -DWANT_QT4:BOOL="0" -DCMAKE_BUILD_TYPE:STRING="Release" -DWANT_AUDIOFILE:BOOL="1" -DWANT_KDE:BOOL="1" 
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
