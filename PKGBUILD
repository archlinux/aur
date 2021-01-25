# Maintainer: Christoph Brill <aur@christophbrill.de>

pkgbase=gtksourceviewmm4
pkgname=(gtksourceviewmm4 gtksourceviewmm4-docs)
pkgver=3.91.1
pkgrel=1
epoch=2
pkgdesc='C++ bindings for the gtksourceview library'
arch=('x86_64')
url='https://gitlab.gnome.org/GNOME/gtksourceviewmm'
license=('LGPL')
depends=('gtkmm4' 'gtksourceview4')
makedepends=('gtkmm4-docs')
source=("https://download.gnome.org/sources/gtksourceviewmm/${pkgver:0:4}/gtksourceviewmm-$pkgver.tar.xz")
sha256sums=('feaae794c0f97f583a25f297c6c2b80f5f20151fdc9a4012fddb911520131721')

build() {
  cd gtksourceviewmm-$pkgver
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_gtksourceviewmm4() {
  cd gtksourceviewmm-$pkgver
  make DESTDIR="$pkgdir" install doc_subdirs=
}

package_gtksourceviewmm4-docs() {
  pkgdesc="Developer documentation for gtksourceviewmm"
  depends=(gtkmm3-docs)

  cd gtksourceviewmm-$pkgver
  make -C docs DESTDIR="$pkgdir" install
}
