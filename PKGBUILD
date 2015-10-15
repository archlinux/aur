#Contributor: M0Rf30
#Maintainer: chron <chronischzuspaet at gmail dot com>

pkgname=gnome-multi-writer
pkgver=3.18.0
pkgrel=1
pkgdesc="Write an ISO file to multiple USB devices at once"
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/hughsie/2015/01/02/introducing-gnome-multiwriter/"
license=('GPL2')
depends=('gtk3' 'udisks2' 'libcanberra')
makedepends=('git' 'intltool' 'yelp-tools' 'gnome-common')
source=('https://git.gnome.org/browse/gnome-multi-writer/snapshot/GNOME_MULTI_WRITER_3_18_0.tar.xz')
sha256sums=('f65e9e1f850a63912138f2b59be675000b889e8ab875510888152190c46f6a80')
install=$pkgname.install

build() {
  cd $srcdir/GNOME_MULTI_WRITER_3_18_0

  ./autogen.sh --prefix=/usr
  make
}

package(){
  cd $srcdir/GNOME_MULTI_WRITER_3_18_0

  # Remove 'NoDisplay=false' from the .desktop file, otherwise it won't show up in dmenu
  sed -i "s/NoDisplay=false//g" data/org.gnome.MultiWriter.desktop

  make DESTDIR=$pkgdir install install-data
}
