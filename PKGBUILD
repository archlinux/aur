# Maintaner: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# Contributor: Teo Mrnjavac <teo@kde.org>

pkgname=qtkeychain-qt5
_pkgname=qtkeychain
pkgver=0.17.0
pkgrel=1
pkgdesc='Provides support for secure credentials storage (Qt5 version)'
arch=('x86_64' 'aarch64')
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
sha256sums=('1280e7c57c69cab2aec45a02702840c0ad387ffab3de306f1c12772af9fc83d4')

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
