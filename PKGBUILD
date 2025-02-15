# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mihkel Tõnnov <mihhkel-at-gmail-dot-com>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Evert Vorster <evorster-at-gmail-dot-com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Maël Kerbiriou <mael.kerbiriou-at-free-dot-fr>

pkgname=amarok-qt6
pkgver=3.2.2
pkgrel=1
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
makedepends=(git extra-cmake-modules kdoctools gdk-pixbuf2 knotifyconfig
             libmtp loudmouth )
optdepends=("libmtp: support for portable media devices"
            "loudmouth: backend needed by mp3tunes for syncing"
            #"taglib-extras: taglib plugins for Audible and RealMedia files"
            )
conflicts=(amarok)
provides=(amarok)
options=(!lto)
source=("https://invent.kde.org/multimedia/amarok/-/archive/v${pkgver}/amarok-v${pkgver}.tar.gz")
sha256sums=('67fcf583e28aa6ca01ad2e589daab066e7bb7a8e846e521b28a3b8f19e738f33')

build() {
  local _flags=(
    -DBUILD_WITH_QT6=TRUE
    -DWITH_GPODDER=OFF
    -DWITH_IPOD=OFF
    -DWITH_LASTFM=OFF
  )

  cmake -B build -S "amarok-v${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
