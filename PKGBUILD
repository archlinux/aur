# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=amarok
pkgver=3.0.1
pkgrel=1
pkgdesc="The powerful music player for KDE"
arch=(x86_64)
url="https://apps.kde.org/de/amarok/"
license=(FDL GPL2 LGPL2.1)
depends=(kcmutils5 kdoctools5 kdnssd5 kirigami2 kirigami-addons5 knewstuff5 ktexteditor5 liblastfm-qt5 libofa
         mariadb phonon-qt5 qt5-webengine threadweaver5 taglib)
makedepends=(extra-cmake-modules gdk-pixbuf2 git knotifyconfig5 qt5-tools loudmouth)
optdepends=(
  "ifuse: support for Apple iPod Touch and iPhone"
  "loudmouth: backend needed by mp3tunes for syncing"
)
source=("https://invent.kde.org/multimedia/amarok/-/archive/v${pkgver}/amarok-v${pkgver}.tar.gz")
sha256sums=('b376b761e4ad7980eb740fa3a62e6a1a6793f41e309a14fe468ddb75972a85b8')

build() {
  cmake -B build -S "amarok-v${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

check() {
  #ctest --test-dir build --output-on-failure
true
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
