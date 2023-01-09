# Maintainer: Lizen_5 <rs.supermarios at gmail dot com>
# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Advaith Madhukar <advaith.madhukar at gmail dot com>

pkgname=pyside6-tools
_qtver=6.4.2
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(LGPL)
pkgdesc='Tools for PySide6'
depends=(pyside6)
conflicts=(pyside2-tools)
makedepends=(cmake shiboken6 qt6-tools)
_pkgfqn=pyside-setup-opensource-src-$_qtver
source=("https://download.qt.io/official_releases/QtForPython/pyside6/PySide6-$pkgver-src/${_pkgfqn}.tar.xz")
sha256sums=('1ec9d0936332efd229650cf10fed36cadddff7a613a2ea6e897de4d504c1b505')

build() {
  cmake -B build -S ${_pkgfqn}/sources/pyside-tools/ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm "$pkgdir"/usr/bin/{designer,assistant,linguist,qmllint,qmltyperegistrar,qmlformat,qmlimportscanner}
  mv "$pkgdir"/usr/bin/rcc "$pkgdir"/usr/bin/pyside6-rcc
  mv "$pkgdir"/usr/bin/uic "$pkgdir"/usr/bin/pyside6-uic
  mv "$pkgdir"/usr/bin/lupdate "$pkgdir"/usr/bin/pyside6-lupdate
  mv "$pkgdir"/usr/bin/lrelease "$pkgdir"/usr/bin/pyside6-lrelease
}
