pkgname=stack-client
pkgver=2.1.1
pkgrel=1
pkgdesc="The STACK Client provides file sync to desktop clients."
arch=('x86_64')
url='https://www.transip.nl/stack/'
license=(GPL2)
depends=('qtkeychain' 'qt5-webkit' 'hicolor-icon-theme' 'xdg-utils')
optdepends=('python2-nautilus: integration with Nautilus' 'nemo-python: 
integration with Nemo')
makedepends=('cmake' 'qt5-tools')
conflicts=('stack-client-bin')
provides=('mirall-git' 'owncloud-client' 'owncloud-client-ngs')
source=("http://mirror.transip.net/stack/software/source/stackclient-${pkgver}-sources-complete.zip")
sha1sums=('cf0d493d4ddec8428e8905a3442ba23b40d32a67')
 
prepare() {
  tar xzf ${pkgname}_${pkgver}.orig.tar.gz
  gunzip ${pkgname}_${pkgver}-1.2.diff.gz
}
 
build() {
  cd transipclient-${pkgver}
 
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/${pkgname} \
        -DWITH_DOC=FALSE \
        -DQTKEYCHAIN_LIBRARY=/usr/lib/libqt5keychain.so \
        -DQTKEYCHAIN_INCLUDE_DIR=/usr/include/qt5keychain/ \
        -DOEM_THEME_DIR=${srcdir}/transipclient-${pkgver}/transip/mirall
  make
}
 
package() {
  cd ${srcdir}/transipclient-${pkgver}
  make DESTDIR=${pkgdir} install
}
