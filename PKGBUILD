# Maintainer: ntwk <rnndxb@gmail.com>

pkgname=virt-viewer-nogui
pkgver=7.0
pkgrel=1
pkgdesc="A lightweight interface for interacting with the graphical display of virtualized guest OS."
depends=('gtk-vnc' 'libvirt' 'spice-gtk' 'desktop-file-utils' 'libvirt-glib' 'libgovirt')
makedepends=('intltool' 'spice-protocol')
provides=('virt-viewer')
replaces=('virtviewer-nogui')
url="http://virt-manager.org/"
arch=('x86_64')
license=('GPL')
source=("https://virt-manager.org/download/sources/virt-viewer/virt-viewer-$pkgver.tar.gz"{,.asc}
        'remove-ui-widgets.patch')
sha512sums=('e0558c9138877f546add6a3df9721e100cadb6953815be82b2376b0521b82cf14052bdc29c42bb03b198b6e9d129a55d33531a153207d7f29b5c1c3402ebc904'
            'SKIP'
            '90ebf50b11b84802e70fbb3ab047aaac39e80c306ab3aff00e04c871a256b6e83b0d5e4a1623eb526fe29d4c9725b049197c6235a5b0d015dd0a90e70f83bb8f')

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
