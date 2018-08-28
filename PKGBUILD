# $Id: PKGBUILD 332903 2018-08-24 06:37:15Z arojas $
# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=amarok
pkgver=2.9.0.git20180816
_commit=8f5ef80
pkgrel=4
pkgdesc="The powerful music player for KDE"
arch=(x86_64)
url="http://amarok.kde.org/"
license=(GPL2 LGPL2.1 FDL)
depends=(mariadb taglib-extras libofa kcmutils kdnssd knewstuff kirigami2 threadweaver ktexteditor qt5-webengine liblastfm-qt5)
makedepends=(extra-cmake-modules loudmouth libmtp libmygpo-qt5 gdk-pixbuf2 libgpod git knotifyconfig)
optdepends=('libgpod: support for Apple iPod audio devices'
            'libmtp: support for portable media devices'
            'loudmouth: backend needed by mp3tunes for syncing'
            'ifuse: support for Apple iPod Touch and iPhone'
            'libmygpo-qt5: gpodder.net Internet Service')
#source=("http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
source=(git://git.kde.org/amarok.git#commit=$_commit)
sha256sums=('SKIP')
validpgpkeys=(D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heirecka@exherbo.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
