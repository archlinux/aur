# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-gtk-theme-bridge
pkgver=6.7.5
pkgrel=1
pkgdesc='Syncs SonicDE settings to GTK applications'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-gtk-theme-bridge'
license=(LGPL-2.0-or-later)
depends=(glib2
         glibc
         kconfig
         kdbusaddons
         libstdc++
         qt6-base
         qt6-svg
         sh
         sonic-decoration
         sonic-frameworks-color-scheme
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-windowsystem
         xdg-desktop-portal-gtk
         xsettingsd)
makedepends=(gtk3
             sassc
             sonic-frameworks-cmake-modules)
optdepends=('gtk3: GTK3 apps support')
provides=(kde-gtk-config)
conflicts=(kde-gtk-config)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fc6b34d7466f37c45cf7af2d0ffd17d40291684239ad60331bf73353db764980')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
