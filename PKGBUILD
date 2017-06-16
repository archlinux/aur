# Maintainer: Lone_Wolf  <lonewolf at xs4all dot nl >
# Contributor: speps <speps dot archlinux dot org>

pkgname=qxmledit
pkgver=0.9.7.1
_realver=0.9.7-1
pkgrel=1.1
pkgdesc="Simple XML editor and XSD viewer"
arch=('x86_64')
url="http://qxmledit.org/"
license=('GPL3' 'LGPL3')
depends=('qt5-svg' 'glu' 'qt5-scxml')
makedepends=('freeglut')
source=("http://downloads.sourceforge.net/project/qxmledit/QXmlEdit-0.9.7/qxmledit-$_realver-src.tgz")
sha256sums=('bcb694f01db5e4f4bedec81f823d498c6270f78da6a0c5963c52956f6c81c443')


build() {
  cd $pkgname-$_realver
  export \
                QXMLEDIT_INST_DIR="/usr/bin" \
                QXMLEDIT_INST_LIB_DIR="/usr/lib" \
                QXMLEDIT_INST_INCLUDE_DIR="/usr/include/${pkgname}" \
                QXMLEDIT_INST_DATA_DIR="/usr/share/${pkgname}" \
                QXMLEDIT_INST_DOC_DIR="/usr/share/doc/${pkgname}"
  qmake-qt5
  make
}

package() {
  cd $pkgname-$_realver
  make INSTALL_ROOT="$pkgdir/" install

  # desktop
  install -Dm644 install_scripts/environment/desktop/QXmlEdit.desktop "$pkgdir/usr/share/applications/QXmlEdit.desktop"

  # icon
  install -Dm644 src/images/icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
