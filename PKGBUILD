# Maintainer: kevku <kevku@gmx.com>
pkgname=qesteidutil
pkgver=3.12.10.1265
pkgrel=5
pkgdesc="UI application for managing smart card PIN/PUK codes and certificates"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('qt5-base>=5.10.0' 'opensc' 'ccid' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-tools' 'qt5-translations')
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.xz"
        "qesteidutil-3.12.10.1265-qt5.11.patch")
sha256sums=('eff23f778dfc287c9ef883f96c9f61eb4d100369e73f94fb3ce1b0f204f9247d'
            '49e2d4e408fb31e947897ec4023ff0f59358f7c64865662f68969d07b9531899')

prepare() {
  [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
  mkdir "$pkgname-build"
  patch -p1 -i "$srcdir/qesteidutil-3.12.10.1265-qt5.11.patch"
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
