# Maintainer: Lone_Wolf  <lone_wolf@klaas-de-kat.nl>
# Contributor: speps <speps dot archlinux dot org>

pkgname=qxmledit
pkgver=0.9.15
pkgrel=1
pkgdesc="Simple XML editor and XSD viewer"
arch=('x86_64')
url="http://qxmledit.org/"
license=('GPL3' 'LGPL3')
depends=('qt5-svg' 'glu' 'qt5-scxml' 'qt5-xmlpatterns' 'qt5-script')
makedepends=('freeglut')
source=("http://downloads.sourceforge.net/project/qxmledit/QXmlEdit-$pkgver/qxmledit-$pkgver-src.tgz")
sha256sums=('84397d5db6cdca068c1d067c36df3f12c2f164e12ee3749e10cc4655112955f5')
sha512sums=('f1bd266d873979f41e5bfce8b52ddbcef325655d96c5888824e427b914b0fd2a7f4321e6bab02f89821c5098fc6e06202eaddc91a7c80ef1d3312a8563a2ad30')


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
