# Maintainer: Brendan Abolivier <brendan@cozycloud.cc>
pkgname=xqilla
pkgver=2.3.3
pkgrel=1
pkgdesc="An XQuery and XPath 2.0 library, written in C++ and built on top of Xerces-C."
arch=("x86_64")
url="http://xqilla.sourceforge.net/"
license=("GPL3")
depends=("xerces-c" "icu")
source=("https://downloads.sourceforge.net/project/xqilla/XQilla-${pkgver}.tar.gz"
        "xerces-containing-node.patch")
sha256sums=('8f76b9b4f966f315acc2a8e104e426d8a76ba4ea3441b0ecfdd1e39195674fd6'
            '36ffb2dff579e5610ca3be2a962942433127b24a78ca454647059d6d54b8e014')

prepare() {
  cd "XQilla-${pkgver}"

  # Apply patch from Homebrew to make XQilla compatible with Xerces-C 3.2.
  # See: https://sourceforge.net/p/xqilla/bugs/48/
  patch -p1 < "${srcdir}/xerces-containing-node.patch"
}

build() {
  cd "XQilla-${pkgver}"
  ./configure --prefix=/usr --with-xerces=/usr
  make
}

package() {
  cd "XQilla-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
