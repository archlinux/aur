# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=amarok
pkgver=3.2.81
pkgrel=1
pkgdesc="The powerful music player for KDE"
arch=(x86_64)
url="https://apps.kde.org/amarok/"
license=(GPL-2.0-or-later)
depends=(kcmutils5 kdnssd5 kirigami2 ktexteditor5 liblastfm-qt5 libofa
         phonon-qt5 threadweaver5 taglib libmygpo-qt5 libmtp mariadb mariadb-libs gdk-pixbuf2 knotifyconfig5

         # namcap implicit depends
         glibc gcc-libs ffmpeg qt5-base qt5-svg qt5-declarative
         kwallet5 karchive5 kio5 kguiaddons5 kitemviews5 kpackage5 kglobalaccel5 kdbusaddons5 kcompletion5
         knotifications5 fftw kcodecs5  kxmlgui5 kcoreaddons5 ki18n5 ktextwidgets5 hicolor-icon-theme
         kwindowsystem5 kconfigwidgets5 kwidgetsaddons5 kconfig5 kiconthemes5 kcrash5 solid5)
makedepends=(extra-cmake-modules git qt5-tools loudmouth qt5-webengine kdoctools5)
optdepends=("libmtp: support for portable media devices"
            "loudmouth: backend needed by mp3tunes for syncing"
            #"taglib-extras: taglib plugins for Audible and RealMedia files"
            )
source=("https://invent.kde.org/multimedia/amarok/-/archive/v${pkgver}/amarok-v${pkgver}.tar.gz")
sha256sums=('aadb2a7fc120952a4219c70a4789396e3a86cf08d4c5131fb8abe1a0f18cfda5')

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
