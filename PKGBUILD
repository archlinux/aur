# Maintainer: Mihkel Tõnnov <mihhkel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Patrick Auernig <patrick.auernig@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=soundkonverter-qt6-git
pkgver=3.0.1.32
pkgrel=1
pkgdesc="Front-end to various audio converters"
arch=('i686' 'x86_64')
url="https://github.com/ssharunas/soundkonverter"
license=('GPL')
depends=(
  'gcc-libs' # libstdc++.so
  'glibc' # libc.so libm.so
  'kcompletion' # libKF5Completion.so
  'kconfig' # libKF5ConfigCore.so
  'kconfigwidgets' # libKF5ConfigWidgets.so
  'kcoreaddons' # libKF5CoreAddons.so
  'cdparanoia' # libcdda_interface.so libcdda_paranoia.so 
  'ki18n' # libKF5I18n.so
  'kio' # libKF5KIOCore.so libKF5KIOWidgets.so
  'knotifications' # libKF5Notifications.so
  'kservice' # libKF5Service.so
  'ktextwidgets' # libKF5TextWidgets.so
  'kwidgetsaddons' # libKF5WidgetsAddons.so
  'kxmlgui' # libKF5XmlGui.so
  'solid' # libKF5Solid.so
  'libkcddb' # libKF5Cddb.so
  'phonon-qt6' # libphonon4qt5.so
  'qt6-base' # libQt5Core.so libQt5Gui.so libQt5Widgets.so libQt5Xml.so
  'taglib'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'kdoctools'
  'extra-cmake-modules'
  'cmake'
  'kstatusnotifieritem'
)
optdepends=(
  'cdrkit: cdda2wav backend'
  'faac: faac backend'
  'faad2: faad backend'
  'ffmpeg: ffmpeg backend'
  'flac: flac backend'
  'fluidsynth: flouidsynth backend'
  'lame: lame backend'
  'mac: mac backend'
  'mplayer: mplayer backend'
  'mp3gain: mp3gain backend'
  'opus-tools: opus backend'
  'speex: speexenc, speexdec backends'
  'timidity++: midi backend'
  'twolame: twolame backend'
  'vorbisgain: vorbisgain backend'
  'vorbis-tools: vorbis tools backend'
  'wavpack: wavpack backend'
  'sox: sox plugin (change sample rate, various effects)'
)
source=("git+https://github.com/ssharunas/soundkonverter.git#branch=port-qt6")
provides=()
conflicts=()
sha256sums=('SKIP')

build() {
  cmake -S soundkonverter/ -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
