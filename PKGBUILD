# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc
pkgver=3.13.6.1525
pkgrel=2
pkgdesc="Qt based UI application for verifying and signing digital signatures"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('libdigidocpp>=3.13.5' 'opensc' 'qt5-base>=5.10.0' 'shared-mime-info' 'ccid' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake' 'qt5-tools' 'qt5-translations')
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.xz"
        "qdigidoc-3.13.6.1525-qt5.11.patch")
sha256sums=('75e86c2626647005d5d5bff94631eea7380802f5d9a78965eec126909558b2a2'
            'b0dacc044ff0a49053eb395b2301d423e72112bb7a053c6b270c6ab3c1a232b0')

prepare() {
  [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
  mkdir "$pkgname-build"
  patch -p1 -i "$srcdir/qdigidoc-3.13.6.1525-qt5.11.patch"
}

build() {
  cd "$pkgname-build"
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DCMAKE_INSTALL_SYSCONFDIR="/etc"
  make
}

package() {
  cd "$pkgname-build"
  make DESTDIR="$pkgdir/" install
}
