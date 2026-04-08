# Maintainer: artist for Sonic-DE

pkgname=sonic-keybind-daemon
pkgver=6.6.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=5
pkgdesc='Daemon for Sonic-DE providing Global Keyboard Shortcut (Accelerator) functionality'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-globalacceld'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         sonic-frameworks-keybind
         kio
         kjobwidgets
         kservice
         libx11
         libxcb
         qt6-base
         sonic-frameworks-windowsystem
         xcb-util-keysyms)
makedepends=(extra-cmake-modules)
groups=(sonicde)
conflicts=(kglobalacceld)
provides=(kglobalacceld)
replaces=(kglobalacceld)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$_dirver.tar.gz")

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

sha256sums=('ced39bb68b0d7517f582ef50f44b95a994324b2876c0c52f7dae10ba38cff25d')

