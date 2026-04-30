# Maintaner: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# Contributor: Teo Mrnjavac <teo@kde.org>

pkgname=qtkeychain-qt5
_pkgname=qtkeychain
pkgver=0.16.0
pkgrel=1
pkgdesc='Provides support for secure credentials storage (Qt5 version)'
arch=(x86_64)
url='https://github.com/frankosterfeld/qtkeychain'
license=(BSD-3-Clause)
depends=(glib2
         glibc
         libgcc
         libstdc++
         org.freedesktop.secrets)
makedepends=(clang
             cmake
             git
             qt5-tools
             qt6-declarative
             qt6-tools)
source=(git+https://github.com/frankosterfeld/qtkeychain#tag=$pkgver)
sha256sums=('27cb78ca44c9395a8b5e1e59dbc68896842d8b39a11d88973833afda1447cf76')

build() {
  cmake -B build-qt5 -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build-qt5
}

package_qtkeychain-qt5() {
  depends+=(qt5-base)
  optdepends=('kwallet5: kwallet backend')
  conflicts=(qtkeychain)
  provides=(qtkeychain)
  replaces=(qtkeychain)

  DESTDIR="$pkgdir" cmake --install build-qt5
  install -Dm644 $_pkgname/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
