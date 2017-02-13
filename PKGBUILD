# Maintainer: Lone_Wolf  <lonewolf at xs4all dot nl >
# Contributor: speps <speps dot archlinux dot org>

pkgname=qxmledit
pkgver=0.9.6
pkgrel=1
pkgdesc="Simple XML editor and XSD viewer"
arch=('x86_64')
url="http://qxmledit.org/"
license=('GPL3' 'LGPL3')
depends=('qt5-svg' 'qt5-xmlpatterns' 'glu' 'qt5-scxml')
makedepends=('freeglut')
source=("http://downloads.sourceforge.net/project/qxmledit/QXmlEdit-$pkgver/qxmledit-$pkgver-src.tgz")
sha256sums=('46928b059d9c00c96d98a5ab0bb6249abdd9225b2bbf280bbb8e0f54a894e964')

prepare() {
  cd $pkgname-$pkgver

  # fix desktop file
#  sed -e '1i[Desktop Entry]' \
#      -e '/Encoding/d;/#/d' \
#      -i install_scripts/environment/desktop/QXmlEdit.desktop

#    sed -i -e '/QMAKE_CXXFLAGS/s:-Werror::' \
#                src/{QXmlEdit,QXmlEditWidget,sessions/QXmlEditSessions}.pro

}

build() {
  cd $pkgname-$pkgver
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
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install

  # desktop
  install -Dm644 install_scripts/environment/desktop/QXmlEdit.desktop \
    "$pkgdir/usr/share/applications/QXmlEdit.desktop"

  # icon
  install -Dm644 install_scripts/environment/icon/qxmledit_48x48.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
