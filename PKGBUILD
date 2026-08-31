# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-io
pkgver=6.29.0.1
pkgrel=2
pkgdesc='Resource and network access abstraction'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-io'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(acl
         glibc
         karchive
         kbookmarks
         kcompletion
         kconfig
         kcrash
         kdbusaddons
         ki18n
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
         sonic-frameworks-color-scheme
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-icon-themes
         sonic-frameworks-windowsystem
         util-linux-libs)
makedepends=(doxygen
             qt6-tools
             sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
optdepends=('audiocd-kio: for accessing audio CDs'
            'kded: proxy management and cookie storage'
            'sonic-frameworks-doctools: for the help kioslave'
            'sonic-frameworks-io-extras: extra protocols support (sftp, fish and more'
            'sonic-frameworks-io-fuse: to mount remote filesystems via FUSE'
            'switcheroo-control: hybrid GPU support')
provides=(kio)
conflicts=(kio)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f6d934883f73618740ea90f09bdd00211da599e648310262daf97a84ad1b6d27')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
