# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kinit5
_pkgname=kinit
pkgver=5.116.0
pkgrel=4
pkgdesc='Process launcher to speed up launching KDE applications'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kio5)
makedepends=(extra-cmake-modules kdoctools5)
groups=(kf5)
replaces=(kinit)
conflicts=(kinit)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-$pkgver.tar.xz{,.sig})
install=kinit5.install
sha256sums=('e4a4acc661035d22f7636397d23307c2e4e4129a7ed82d458fdf2f7ee63dbc2c'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
