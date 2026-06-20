# Maintainer: WackyIdeas <wackyideas@disroot.org>

pkgname=('aerothemeplasma-desktop-git')
pkgver=6.7.0_724.r5fd2458
pkgrel=1
pkgdesc="An alternative shell for KDE Plasma that aims to replicate the look and feel of Windows 7"
arch=(x86_64)
url="https://github.com/aeroshell-desktop/aerothemeplasma"
license=('AGPL-3.0-or-later')
depends=(gcc-libs
         bash
         glibc
         aeroshell-libplasma
         aeroshell-workspace
         aeroshell-kwin-components
         aerothemeplasma-sounds
         aerothemeplasma-icons
         aeroshell-smod
         qt6-virtualkeyboard
         qt6-multimedia
         qt6-5compat
         qt6-wayland
         qt6-declarative
         kconfigwidgets
         ksvg
         wayland
         kiconthemes
         plasma-activities
         kjobwidgets
         kio
         kglobalaccel
         kpipewire
         ki18n
         kwin
         plasma-workspace
         powerdevil
         kauth
         kcmutils
         networkmanager-qt
         kconfig
         kquickcharts
         prison
         knewstuff
         kdeclarative
         kirigami-addons
         kcoreaddons
         kservice
         kxmlgui
         plasma5support
         kvantum
         sddm
         sddm-kcm
         plasma-nm
         plasma-pa
         kwindowsystem
         knotifications
         knotifyconfig
         kmenuedit
         kirigami
         kitemmodels
         kpackage
         kwidgetsaddons
         plasma-desktop
         qt6-base)
optdepends=(uac-polkit-agent
            qrca)
makedepends=(git
             extra-cmake-modules
             plasma-wayland-protocols)
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
conflicts=(aerothemeplasma-desktop)
provides=(aerothemeplasma-desktop)
groups=(aerothemeplasma)

pkgver() {
  cd "$srcdir/${pkgname%}"
  echo "$(grep 'set(PROJECT_VERSION ' CMakeLists.txt | cut -d '"' -f 2)_$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
}

build() {
  DESTDIR="$pkgdir" cmake -B build -S ${pkgname%} \
    -DBUILD_TESTING=OFF -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
