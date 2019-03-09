# Maintainer: ntwk <rnndxb@gmail.com>

pkgname=virt-viewer-nogui
pkgver=7.0
pkgrel=2
pkgdesc="A graphical console viewer for virtual machines, without the UI widgets"
depends=('gtk-vnc' 'libvirt' 'spice-gtk' 'desktop-file-utils' 'libvirt-glib' 'libgovirt')
makedepends=('intltool' 'spice-protocol')
provides=('virt-viewer')
conflicts=('virt-viewer' 'virtviewer-nogui')
url="http://virt-manager.org/"
arch=('x86_64')
license=('GPL')
validpgpkeys=('DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF')
source=("https://virt-manager.org/download/sources/virt-viewer/virt-viewer-$pkgver.tar.gz"{,.asc}
        'remove-ui-widgets.patch')
sha512sums=('e0558c9138877f546add6a3df9721e100cadb6953815be82b2376b0521b82cf14052bdc29c42bb03b198b6e9d129a55d33531a153207d7f29b5c1c3402ebc904'
            'SKIP'
            'fba18dd4370231709e3c21871877daa6406eb4cb7945decbd34f8d2b3d8105c9617ec01ce4eabdce11e39d6916529b376056d502a7fcb5717e2a7e3e6045e3e5')

build() {
  cd $srcdir/virt-viewer-$pkgver
  patch -p1 -i ../remove-ui-widgets.patch
  ./configure --prefix=/usr --with-spice --disable-update-mimedb
  make
}

package() {
  cd $srcdir/virt-viewer-$pkgver
  make DESTDIR=$pkgdir install
}
