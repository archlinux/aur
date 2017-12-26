# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc
pkgver=3.13.5.1522
pkgrel=1
pkgdesc="Qt based UI application for verifying and signing digital signatures"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('libdigidocpp>=3.13.3' 'opensc' 'qt5-base>=5.10.0' 'shared-mime-info' 'ccid' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake' 'qt5-tools' 'qt5-translations')
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('f3e6f41483e46ddd94791c7af7846accbd98792b05f87ee670acade7a60b1a2a')

prepare() {
  [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
  mkdir "$pkgname-build"
}

build() {
  cd "$pkgname-build"
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DCMAKE_INSTALL_SYSCONFDIR="/etc" \
           -DBREAKPAD=""
  make
}

package() {
  cd "$pkgname-build"
  make DESTDIR="$pkgdir/" install
}
