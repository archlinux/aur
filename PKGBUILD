pkgname=kvirc4-git-nokde
_real=kvirc4-git
pkgver=r7326.85ef2059c
pkgrel=1
pkgdesc="Qt5 based IRC-Client, compiled without kde4 support - Git Version"
arch=('i686' 'x86_64')
url="http://www.kvirc.net"
license=('GPL')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-x11extras' 'glibc' 'openssl-1.0' 'zlib' 'perl')
makedepends=('cmake' 'git' 'automoc4' 'gettext' 'doxygen' 'openssl-1.0')
conflicts=('kvirc4' 'kvirc')
provides=('kvirc' 'kvirc4')
source=("kvirc4-git::git+https://github.com/kvirc/KVIrc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_real"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_real"
  cmake -DCMAKE_INSTALL_PREFIX="$(kde4-config --prefix)" \
        -DWANT_PHONON=OFF \
        -DWANT_ENCHANT=OFF \
        -DWANT_KDE4=OFF \
        -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 \
        -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so \
        -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so
  make
}

package() {
  cd "$_real"
  make DESTDIR="$pkgdir" install
}
