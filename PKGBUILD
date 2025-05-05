# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=amarok
pkgver=3.2.81
pkgrel=2
pkgdesc="The powerful music player for KDE"
arch=(x86_64)
url="https://apps.kde.org/amarok/"
license=(GPL-2.0-or-later)
depends=(threadweaver qt6-webengine phonon-qt6 qt6-declarative
         kcmutils knewstuff ktexteditor kdnssd kirigami2 kstatusnotifieritem ktextwidgets
         mariadb libmariadbclient fftw ffmpeg taglib libofa qt6-tools

         # namcap implicit depends
         qt6-5compat kiconthemes ki18n qt6-svg gcc-libs kcompletion kitemviews kwidgetsaddons solid karchive kcrash
         kdbusaddons kconfigwidgets kpackage kcodecs knotifications hicolor-icon-theme kxmlgui qt6-base kconfig
         kcoreaddons kglobalaccel kirigami kwindowsystem kguiaddons glibc kio kcolorscheme)
makedepends=(git extra-cmake-modules kdoctools gdk-pixbuf2 knotifyconfig vulkan-headers
             libmtp loudmouth)
optdepends=("libmtp: support for portable media devices"
            "loudmouth: backend needed by mp3tunes for syncing"
            #"taglib-extras: taglib plugins for Audible and RealMedia files"
            )
source=("https://invent.kde.org/multimedia/amarok/-/archive/v${pkgver}/amarok-v${pkgver}.tar.gz")
sha256sums=('aadb2a7fc120952a4219c70a4789396e3a86cf08d4c5131fb8abe1a0f18cfda5')

build() {
  local _flags=(
    -DWITH_IPOD=OFF
    -DWITH_GPODDER=OFF
    -DWITH_LASTFM=OFF
    -DBUILD_TESTING=OFF
  )

  cmake -B build -S "amarok-v${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
