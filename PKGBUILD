# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=amarok
pkgver=2.9.0.r249.67c651bc60
_commit=67c651bc60743bce79aeaf35f3e4d734e26eee62
pkgrel=1
pkgdesc="The powerful music player for KDE"
arch=(x86_64)
url="http://amarok.kde.org/"
license=("GPL2" "LGPL2.1" "FDL")
depends=("kcmutils" "kdnssd" "kirigami2" "knewstuff" "ktexteditor" "liblastfm-qt5" "libofa" "mariadb" "qt5-webengine" "taglib-extras" "threadweaver")
makedepends=("extra-cmake-modules" "gdk-pixbuf2" "git" "knotifyconfig" "libgpod" "libmtp" "libmygpo-qt5" "loudmouth")
optdepends=("ifuse: support for Apple iPod Touch and iPhone"
            "libgpod: support for Apple iPod audio devices"
            "libmtp: support for portable media devices"
            "libmygpo-qt5: gpodder.net Internet Service"
            "loudmouth: backend needed by mp3tunes for syncing")
#source=("http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
source=("git://git.kde.org/amarok.git#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=("D81C0CB38EB725EF6691C385BB463350D6EF31EF") # Heiko Becker <heirecka@exherbo.org>

prepare() {
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake "../${pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="$pkgdir" install
}
