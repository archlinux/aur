# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: speps <speps dot archlinux dot org>

pkgname=qxmledit
pkgver=0.9.15
pkgrel=2
pkgdesc="Simple XML editor and XSD viewer"
arch=(x86_64)
url="https://qxmledit.org/"
license=(LGPL)
depends=(glu hicolor-icon-theme qt5-scxml qt5-svg qt5-xmlpatterns)
makedepends=(qt5-tools)
source=(https://downloads.sourceforge.net/qxmledit/$pkgname-$pkgver-src.tgz)
sha256sums=('84397d5db6cdca068c1d067c36df3f12c2f164e12ee3749e10cc4655112955f5')

prepare() {
  cd $pkgname-$pkgver
  sed -i '/INSTALLS += desktopInfo/d' src/QXmlEdit.pro
}

build() {
  cd $pkgname-$pkgver
  lrelease src/QXmlEdit.pro src/QXmlEditWidget.pro src/sessions/QXmlEditSessions.pro
  qmake \
    QXMLEDIT_INST_DIR=/usr/bin \
    QXMLEDIT_INST_LIB_DIR=/usr/lib \
    QXMLEDIT_INST_INCLUDE_DIR=/usr/include/$pkgname \
    QXMLEDIT_INST_DATA_DIR=/usr/share/$pkgname \
    QXMLEDIT_INST_DOC_DIR=/usr/share/doc/$pkgname
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 install_scripts/environment/man/qxmledit.1 "$pkgdir/usr/share/man/man1/qxmledit.1"
  install -Dm644 install_scripts/environment/desktop/QXmlEdit.desktop "$pkgdir/usr/share/applications/QXmlEdit.desktop"
  install -Dm644 install_scripts/environment/desktop/QXmlEdit.appdata.xml "$pkgdir/usr/share/metainfo/QXmlEdit.appdata.xml"
  install -Dm644 install_scripts/environment/icon/qxmledit.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/qxmledit.png"
  install -Dm644 install_scripts/environment/icon/qxmledit_48x48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/qxmledit.png"
  install -Dm644 src/images/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/qxmledit.svg"
}
