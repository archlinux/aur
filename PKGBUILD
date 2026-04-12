# Maintainer: artist for Sonic-DE

pkgname=sonic-keybind-daemon
pkgver=6.6.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
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

sha256sums=('83aa0196fae72af999a08efe2fd290f07506398062e29cfa81d33201f6ec4139')
