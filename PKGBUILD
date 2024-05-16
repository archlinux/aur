# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=konqueror-git
_pkgname=konqueror
pkgver=24.01.90.r85.g83428ef39
pkgrel=1
pkgdesc='KDE File Manager & Web Browser'
arch=("x86_64")
url='https://apps.kde.org/konqueror/'
license=(LGPL-2.0-or-later)
depends=("dolphin" "keditbookmarks" "qt6-webengine")
makedepends=(cmake
         gcc-libs
         glibc
         git
         karchive
         kbookmarks
         kcmutils
         kcodecs
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kdesu
         kguiaddons
         ki18n
         kiconthemes
         kio
         kitemviews
         kjobwidgets
         kparts
         kservice
         ktextwidgets
         kwallet
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         qt6-base
         qt6-webengine
         solid
         sonnet
         zlib)
optdepends=('kdesu: shell command plugin')
conflicts=("konqueror")
provides=("konqueror")
groups=(kde-applications
        kde-network)
source=("git+https://invent.kde.org/network/konqueror.git")
sha512sums=('SKIP')
 
pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
 
build() {
  cmake -B $_pkgname/build -S $_pkgname \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6 \
    -DUSE_SYSTEM_DICTIONARIES=ON
  cmake --build $_pkgname/build
}

package() {
  DESTDIR="$pkgdir" cmake --install $_pkgname/build
}
