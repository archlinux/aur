#Contributor: M0Rf30
#Maintainer: Alexander 'chron' Kempen <chronischzuspaet at gmail dot com>

pkgname=gnome-multi-writer
pkgver=3.16.0
pkgrel=1
pkgdesc="Write an ISO file to multiple USB devices at once"
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/hughsie/2015/01/02/introducing-gnome-multiwriter/"
license=('GPL2')
depends=('gtk3' 'udisks2' 'libcanberra')
makedepends=('git' 'intltool' 'yelp-tools' 'gnome-common')
source=('https://git.gnome.org/browse/gnome-multi-writer/snapshot/gnome-multi-writer-GNOME_MULTI_WRITER_3_16_0.tar.xz')
sha256sums=('795a8c985c795c3feb214c127a19798dfadad998171e0edbe38bb4048348e3dd')
install=$pkgname.install

build() {
  cd $srcdir/${pkgname}-GNOME_MULTI_WRITER_3_16_0

  ./autogen.sh --prefix=/usr

  # docbook2man expects xml, but file is sgml
  sed -i "s/docbook2man \$?/docbook2man --sgml \$?/g" man/Makefile

  make
}

package(){
  cd $srcdir/${pkgname}-GNOME_MULTI_WRITER_3_16_0

  # Remove 'NoDisplay=false' from the .desktop file, otherwise it won't show up in dmenu
  sed -i "s/NoDisplay=false//g" data/org.gnome.MultiWriter.desktop

  make DESTDIR=$pkgdir install install-data
}
