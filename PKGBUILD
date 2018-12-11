# Maintainer: Lone_Wolf  <lonewolf at xs4all dot nl >
# Contributor: speps <speps dot archlinux dot org>

pkgname=qxmledit
pkgver=0.9.12
pkgrel=1
pkgdesc="Simple XML editor and XSD viewer"
arch=('x86_64')
url="http://qxmledit.org/"
license=('GPL3' 'LGPL3')
depends=('qt5-svg' 'glu' 'qt5-scxml' 'qt5-xmlpatterns')
makedepends=('freeglut')
source=("http://downloads.sourceforge.net/project/qxmledit/QXmlEdit-$pkgver/qxmledit-$pkgver-src.tgz")
sha256sums=('d7636daf8a4623b7b325df4dde358fc28113e11de457b0b91136d05029b06952')


build() {
  cd "$pkgname-$pkgver"
  export \
                QXMLEDIT_INST_DIR="/usr/bin" \
                QXMLEDIT_INST_LIB_DIR="/usr/lib" \
                QXMLEDIT_INST_INCLUDE_DIR="/usr/include/${pkgname}" \
                QXMLEDIT_INST_DATA_DIR="/usr/share/${pkgname}" \
                QXMLEDIT_INST_DOC_DIR="/usr/share/doc/${pkgname}"
  qmake-qt5 \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install

  # man files
  gzip -k install_scripts/environment/man/qxmledit.1
  install -Dm644 install_scripts/environment/man/qxmledit.1.gz "$pkgdir/usr/share/man/man1/qxmledit.1.gz"
  
  # desktop
  install -Dm644 install_scripts/environment/desktop/QXmlEdit.desktop "$pkgdir/usr/share/applications/QXmlEdit.desktop"

  # icon
  install -Dm644 src/images/icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
