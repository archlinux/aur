# Merged with official ABS plasma-desktop PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-desktop-git
pkgver=6.0.80_r11524.gf3a8cd50e
pkgrel=1
pkgdesc='KDE Plasma Desktop'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(baloo-git gcc-libs glibc icu kauth-git kbookmarks-git kcmutils-git kcodecs-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git kdbusaddons-git kdeclarative-git kglobalaccel-git kguiaddons-git ki18n-git kiconthemes-git kio-git kirigami-git kirigami-addons-git kitemmodels-git kitemviews-git kjobwidgets-git kmenuedit-git knewstuff-git knotifications-git knotifyconfig-git kpackage-git kpipewire-git krunner-git kservice-git ksvg-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git libcanberra libksysguard-git libx11 libxcb libxcursor libxi libxkbcommon libxkbfile libplasma-git plasma-activities-git plasma-activities-stats-git plasma-workspace-git plasma5support-git polkit-kde-agent-git powerdevil-git qt6-5compat qt6-base qt6-declarative qt6-wayland sdl2 solid-git sonnet-git systemsettings-git wayland xcb-util-keysyms xdg-user-dirs)
makedepends=(git extra-cmake-modules-git intltool kaccounts-integration-git kdoctools-git libibus packagekit-qt6 scim wayland-protocols xf86-input-evdev xf86-input-libinput xorg-server-devel)
groups=(plasma-git)
optdepends=('bluedevil-git: Bluetooth applet'
            'glib2: kimpanel IBUS support'
            'ibus: kimpanel IBUS support'
            'kaccounts-integration-git: OpenDesktop integration plugin'
            'kscreen-git: screen management'
            'libaccounts-qt: OpenDesktop integration plugin'
            'packagekit-qt6: to install new krunner plugins'
            'plasma-nm-git: Network manager applet'
            'plasma-pa-git: Audio volume applet'
            'scim: kimpanel SCIM support')
conflicts=(${pkgname%-git} user-manager knetattach user-manager-git knetattach-git)
provides=(${pkgname%-git} user-manager knetattach user-manager-git knetattach-git)
replaces=(user-manager-git knetattach-git)
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
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
