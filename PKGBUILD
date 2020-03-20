# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kvirc-nokde
pkgver=5.0.0
pkgrel=2
pkgdesc='Qt5 based IRC-Client without KDE dependencies'
arch=('i686' 'x86_64')
url='https://github.com/kvirc/KVIrc'
license=('GPL2')
depends=('qt5-base' 'glibc' 'openssl' 'zlib' 'perl' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'qt5-webkit' 'phonon-qt5' 'enchant')
makedepends=('cmake')
conflicts=('kvirc')
provides=('kvirc')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('f57334ec1fa0731a41048ac184713070')

build() {
  mkdir "${srcdir}/KVIrc-${pkgver}"/build 
  cd "${srcdir}/KVIrc-${pkgver}"/build 
  cmake ../ \
  -DCMAKE_INSTALL_PREFIX=/usr \
    -DWANT_QT4:BOOL='0' \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DWANT_PERL=ON \
    -DWANT_AUDIOFILE:BOOL='1' \
    -DWANT_GTKSTYLE:BOOL='1' \
    -DWANT_KDE:BOOL='0' \
    -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 \
    -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so \
    -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so
  make
}

package() {
  cd "${srcdir}/KVIrc-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
}