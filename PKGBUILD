# Merged with official ABS plasma-workspace PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=plasma-workspace-git
pkgver=6.0.80_r15538.g2f809bd794
pkgrel=2
pkgdesc='KDE Plasma Workspace'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(accountsservice appstream-qt fontconfig freetype2 gcc-libs glibc icu plasma-activities-git plasma-activities-stats-git kactivitymanagerd-git karchive-git kauth-git kbookmarks-git kcmutils-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git kde-cli-tools-git kdeclarative-git kded-git kdbusaddons-git kglobalaccel-git kguiaddons-git kholidays-git ki18n-git kiconthemes-git kidletime-git kio-git kio-extras-git kio-fuse-git kirigami-git kirigami-addons-git kitemmodels-git kjobwidgets-git knewstuff-git knotifications-git knotifyconfig-git kpackage-git kparts-git kpipewire-git krunner-git kquickcharts-git kscreenlocker-git kservice-git kstatusnotifieritem-git ksvg-git ksystemstats-git ktexteditor-git ktextwidgets-git kuserfeedback-git kwallet-git kwayland-git kwidgetsaddons-git kwin-git kwindowsystem-git kxmlgui-git layer-shell-qt-git libcanberra libice libkexiv2-git libksysguard-git libqalculate libsm libx11 libxau libxcb libxcrypt libxcursor libxfixes libxft libxtst milou-git ocean-sound-theme-git phonon-qt6-git plasma-integration-git libplasma-git plasma5support-git prison-git qt6-5compat qt6-base qt6-declarative qt6-shadertools qt6-svg qt6-tools qt6-virtualkeyboard qt6-wayland sh solid-git systemd-libs wayland xcb-util xcb-util-image xorg-xmessage xorg-xrdb xorg-xsetroot xorg-xwayland-git zlib)
makedepends=(git baloo-git extra-cmake-modules-git gpsd kdoctools-git kunitconversion-git networkmanager-qt-git plasma-wayland-protocols-git)
optdepends=('appmenu-gtk-module: global menu support for GTK2 and some GTK3 applications'
            'baloo-git: Baloo search runner'
            'discover-git: manage applications installation from the launcher'
            'gpsd: GPS based geolocation'
            'kdepim-addons-git: displaying PIM events in the calendar'
            'kwayland-integration-git: Wayland integration for Qt5 applications'
            'networkmanager-qt-git: IP based geolocation'
            'plasma-workspace-wallpapers-git: additional wallpapers')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DGLIBC_LOCALE_GEN=OFF \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
