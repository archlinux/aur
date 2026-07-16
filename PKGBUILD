# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-io
pkgver=6.28.0
pkgrel=2
pkgdesc='Resource and network access abstraction'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-io'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(acl
         glibc
         karchive
         kbookmarks
         kcolorscheme
         kcompletion
         kconfig
         kcrash
         kdbusaddons
         ki18n
         kiconthemes
         kitemviews
         kjobwidgets
         kservice
         kwallet
         kwidgetsaddons
         libstdc++
         libxml2
         libxslt
         qt6-base
         solid
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-windowsystem
         util-linux-libs)
makedepends=(doxygen
             qt6-tools
             sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
optdepends=('audiocd-kio: for accessing audio CDs'
            'kded: proxy management and cookie storage'
            'kio-fuse: to mount remote filesystems via FUSE'
            'sonic-frameworks-doctools: for the help kioslave'
            'sonic-frameworks-io-extras: extra protocols support (sftp, fish and more)'
            'switcheroo-control: hybrid GPU support')
provides=(kio)
conflicts=(kio)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('11f1485039124a4a88f07da5a52c338aeb7314e48520d9c62dfcec27d202fa3f')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
