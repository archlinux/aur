# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-desktop-interface
pkgver=6.6.5.1
pkgrel=1
pkgdesc='Sonic Desktop Interface'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-desktop-interface'
license=(LGPL-2.0-or-later)
depends=(baloo
         emoji-font # for clock and language KCMs
         gcc-libs
         glibc
         kbookmarks
         kcmutils
         kcodecs
         kcompletion
         kconfig
         kconfigwidgets
         kcrash
         kdbusaddons
         kdeclarative
         ki18n
         kiconthemes
         kirigami-addons
         kitemmodels
         kitemviews
         kjobwidgets
         kmenuedit
         knewstuff
         knotifications
         knotifyconfig
         kpackage
         kpipewire
         kservice
         ksvg
         kwidgetsaddons
         kxmlgui
         libcanberra
         libwacom
         libx11
         libxcb
         libxcursor
         libxi
         libxkbcommon
         libxkbfile
         plasma-activities-stats
         plasma5support
         polkit-kde-agent
         powerdevil
         qt6-5compat
         qt6-base
         qt6-declarative
         sdl2
         solid
         sonic-activities
         sonic-frameworks-auth
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-io
         sonic-frameworks-keybind
         sonic-frameworks-open-collab
         sonic-frameworks-quick-ui
         sonic-frameworks-runner
         sonic-frameworks-windowsystem
         sonic-interface-libraries
         sonic-sysguard-library
         sonic-win
         sonic-workspace
         sonnet
         systemd-libs
         systemsettings
         xcb-util-keysyms
         xdg-user-dirs)
optdepends=('bluedevil: Bluetooth applet'
            'glib2: kimpanel IBUS support'
            'ibus: kimpanel IBUS support'
            'kaccounts-integration: OpenDesktop integration plugin'
            'libaccounts-qt: OpenDesktop integration plugin'
            'packagekit-qt6: to install new krunner plugins'
            'scim: kimpanel SCIM support'
            'sonic-audio-applet-pulse: Audio volume applet'
            'sonic-network-manager: Network manager applet'
            'sonic-screen: screen management')
makedepends=(intltool
             kaccounts-integration
             libibus
             packagekit-qt6
             scim
             sonic-frameworks-cmake-modules
             sonic-frameworks-doctools
             xf86-input-libinput
             xorg-server-devel)
provides=(plasma-desktop)
conflicts=(plasma-desktop)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('140935af3786de1e10b3f4dd7f6f39181cc347f2f52ed03800d27a2bc9631983')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
