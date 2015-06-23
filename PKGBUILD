# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=4pane
pkgver=3.0
pkgrel=1
pkgdesc="A multi-pane, detailed-list file manager."
arch=('i686' 'x86_64')
url="http://www.4pane.co.uk/index.html"
license=('GPL3')
depends=('wxgtk')
source=(http://downloads.sourceforge.net/project/fourpane/${pkgver}/${pkgname}-${pkgver}.tar.gz 4Pane.desktop)
md5sums=('396f968e3cd77c0d8f56c3d687b9ee32'
         'b3bafbcc64bde3e3742f994574da5fdd')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  export LIBS="-lgtk-x11-2.0 -lgobject-2.0"
  ./configure --prefix=/usr --disable-desktop --disable-symlink
  make || return 1
}

package() {
#  cd ${srcdir}/${pkgname}-${pkgver}
#
#  ln -s ${srcdir}/${pkgname}-${pkgver}/4Pane ${pkgdir}/usr/bin/4pane
#  install -d -m755 ${pkgdir}/usr/share/{applications,pixmaps} || return 3
#  install -D -m644 ${srcdir}/4Pane.desktop ${pkgdir}/usr/share/applications/ || return 4
#  ln -s ../4Pane/bitmaps/4PaneIcon48.png ${pkgdir}/usr/share/pixmaps/4Pane.png
  cd ${srcdir}/${pkgname}-${pkgver}
  export LIBS="-lgtk-x11-2.0 -lgobject-2.0"
  make DESTDIR=${pkgdir} install || return 2
  install -d -m755 ${pkgdir}/usr/share/applications
  ln -s ../4Pane/rc/4Pane.desktop ${pkgdir}/usr/share/applications/4Pane.desktop
}
