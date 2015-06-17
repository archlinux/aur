#Maintainer: M0Rf30

_pkgname=gnome-multi-writer
pkgname=${_pkgname}-git
pkgver=161.fb444c5
pkgrel=1
pkgdesc="GNOME MultiWriter can be used to write an ISO file to multiple USB devices at 	once"
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/hughsie/2015/01/02/introducing-gnome-multiwriter/"
license=('GPL2')
depends=('gtk3' 'udisks2' 'libgusb' 'libcanberra')
makedepends=('git' 'intltool' 'yelp-tools' 'gnome-common')
source=(${_pkgname}::git+https://git.gnome.org/browse/${_pkgname}/)
install=$_pkgname.install

build() {
  cd $srcdir/${_pkgname}
  ./autogen.sh --prefix=/usr
  sed -i "s/docbook2man \$?/docbook2man --sgml \$?/g" man/Makefile
  make
}

package(){
  cd $srcdir/${_pkgname}
  make DESTDIR=$pkgdir install install-data
}

pkgver() {
  cd $srcdir/${_pkgname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
