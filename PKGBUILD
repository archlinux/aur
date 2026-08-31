# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexey D. <lq07829icatm at rambler.ru>

pkgname=sonic-workspace
pkgver=6.7.4.6
pkgrel=1
pkgdesc='SonicDE workspace components'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-workspace'
license=(LGPL-2.0-or-later)
depends=(accountsservice
         appstream-qt
         dbus
         fontconfig
         freetype2
         glibc
         icu
         kactivitymanagerd
         karchive
         kbookmarks
         kcmutils
         kcompletion
         kconfig
         kcrash
         kdbusaddons
         kdeclarative
         kded
         kholidays
         ki18n
         kitemmodels
         kjobwidgets
         knewstuff
         knotifications
         kpackage
         kparts
         kquickcharts
         kservice
         kstatusnotifieritem
         ksvg
         ksystemstats
         ktexteditor
         ktextwidgets
         kuserfeedback
         kwallet
         kwidgetsaddons
         kxmlgui
         libcanberra
         libgcc
         libice
         libkexiv2
         libqalculate
         libsm
         libstdc++
         libx11
         libxau
         libxcb
         libxcrypt
         libxcursor
         libxfixes
         libxft
         libxtst
         milou
         ocean-sound-theme
         prison
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-location
         qt6-positioning
         qt6-svg
         qt6-tools # for qdbus
         qt6-virtualkeyboard
         sh
         solid
         sonic-activities
         sonic-activities-stats
         sonic-frameworks-auth
         sonic-frameworks-color-scheme
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-idle-tracker
         sonic-frameworks-icon-themes
         sonic-frameworks-io
         sonic-frameworks-io-extras
         sonic-frameworks-io-fuse
         sonic-frameworks-keybind
         sonic-frameworks-quick-ui
         sonic-frameworks-quick-ui-addons
         sonic-frameworks-runner
         sonic-frameworks-settings-ui
         sonic-frameworks-windowsystem
         sonic-interface-libraries
         sonic-night-light
         sonic-pipewire
         sonic-screenlocker
         sonic-system-monitor-library
         sonic-win
         sonic-terminal-tools
         systemd-libs
         xcb-util
         xcb-util-cursor
         xcb-util-image
         xcb-util-wm
         xorg-xmessage
         xorg-xrdb
         zlib)
makedepends=(baloo
             networkmanager-qt
             qcoro
             sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
optdepends=('appmenu-gtk-module: global menu support for some GTK3 applications'
            'baloo: Baloo search runner'
            'discover: manage applications installation from the launcher'
            'kdepim-addons: displaying PIM events in the calendar'
            'networkmanager-qt: IP based geolocation'
            'plasma5-integration: use Plasma settings in Qt5 applications'
            'sonic-workspace-wallpapers: additional wallpapers'
            'xdg-desktop-portal-gtk: sync font settings to Flatpak apps')
provides=(plasma-workspace plasma-x11-session sonic-x11-session)
conflicts=(plasma-workspace plasma-x11-session sonic-x11-session)
replaces=(sonic-x11-session)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('39155c85b67c79ce443c997f9bb58944b2bde4c066f0ee7fb86a6961b22141b5')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DGLIBC_LOCALE_GEN=OFF \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
