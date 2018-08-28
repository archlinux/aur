# $Id$
# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=amarok
pkgver=2.9.0
pkgrel=2
pkgdesc="The powerful music player for KDE"
arch=(x86_64)
url="http://amarok.kde.org/"
license=(GPL2 LGPL2.1 FDL)
depends=(kdebase-runtime mariadb taglib-extras liblastfm ffmpeg libofa qjson qtscriptgenerator)
makedepends=('automoc4' 'cmake' 'libgpod' 'libmtp' 'loudmouth' 'libmygpo-qt' 'qca-qt4')
optdepends=('libgpod: support for Apple iPod audio devices'
            'libmtp: support for portable media devices'
            'loudmouth: backend needed by mp3tunes for syncing'
            'ifuse: support for Apple iPod Touch and iPhone'
            'libmygpo-qt: gpodder.net Internet Service'
            'gst-libav: MP3 codecs'
            'qca-qt4: Ampache support')
source=("http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('e3678de79db36956bc8588b9905726ace1b9188e7fdf89eaea265f1cb03116fd'
            'SKIP')
validpgpkeys=(D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heirecka@exherbo.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_NepomukCore=OFF \
    -DWITH_Soprano=OFF \
    -DWITH_QTWEBKIT=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
