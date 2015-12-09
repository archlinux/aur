# Maintainer: ntwk <rnndxb@gmail.com>

_pkgname=virtviewer
pkgname=${_pkgname}-nogui
pkgver=3.0
pkgrel=1
pkgdesc="A graphical console viewer for virtual machines, without the UI widgets"
depends=('gtk-vnc' 'libvirt' 'spice-gtk3' 'desktop-file-utils')
makedepends=('intltool' 'spice-protocol')
provides=('virtviewer')
conflicts=('virtviewer')
url="http://virt-manager.org/"
arch=('i686' 'x86_64')
license=('GPL')
install=${pkgname}.install
source=(http://virt-manager.org/download/sources/virt-viewer/virt-viewer-${pkgver}.tar.gz
        'remove-ui-widgets.patch')
md5sums=('f36b1b85da943eba7ad72fd93ba63435'
         'dcd69b82a689b27b4a7c45a187a6fd57')

build() {
  cd $srcdir/virt-viewer-$pkgver
  patch -p1 -i ../remove-ui-widgets.patch
  ./configure --prefix=/usr --with-gtk=3.0 --disable-update-mimedb
  make
}

package() {
  cd $srcdir/virt-viewer-$pkgver
  make DESTDIR=$pkgdir install
}
