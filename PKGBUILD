#Contributor: M0Rf30
#Maintainer: chron <chron at posteo dot de>

pkgname=gnome-multi-writer
_pkgname=GNOME_MULTI_WRITER
pkgver=3.19.90
_pkgver=3_19_90
pkgrel=1
pkgdesc="Write an ISO file to multiple USB devices at once"
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/hughsie/2015/01/02/introducing-gnome-multiwriter/"
license=('GPL2')
depends=('gtk3' 'udisks2' 'libcanberra')
makedepends=('git' 'intltool' 'yelp-tools' 'gnome-common')
source=(https://git.gnome.org/browse/gnome-multi-writer/snapshot/${_pkgname}_${_pkgver}.tar.xz)
sha256sums=('0f09bdb544e4adee2649bb25ec2862cd185435b3a9fda2a456aca050f4c68d3e')
install=$pkgname.install

build() {
  cd $srcdir/${_pkgname}_${_pkgver}
  ./autogen.sh --prefix=/usr
  make
}

check() {
  cd $srcdir/${_pkgname}_${_pkgver}
  make check
}

package(){
  cd $srcdir/${_pkgname}_${_pkgver}
  # Remove 'NoDisplay=false' from the .desktop file, otherwise it won't show up in dmenu
  sed -i "s/NoDisplay=false//g" data/org.gnome.MultiWriter.desktop

  make DESTDIR=$pkgdir install install-data
}
