# Contributor: Christopher Bayliss <christopher.j.bayliss@gmail.com>
# co-Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xiphos
pkgver=4.1.0
pkgrel=3
pkgdesc="A Bible study tool for GTK3"
arch=('i686' 'x86_64')
url="http://xiphos.org"
pkgdesc="Bible study tool for GTK+"
url="http://xiphos.org/"
depends=('sword>=1.8.1' 'webkit2gtk' 'libgsf' 'gtkhtml4' 'biblesync<=2.0.0' 'enchant1.6' 'gconf')
makedepends=('gnome-common' 'gnome-doc-utils' 'intltool' 'python2' 'dbus-glib' 'docbook-utils')
license=('GPL')
provides=('gnomesword')
conflicts=('gnomesword')
source=("xiphos-${pkgver}.tar.gz::https://github.com/crosswire/xiphos/archive/${pkgver}.tar.gz")
sha512sums=('f2da65a0cf10cda5ca471a09d351be8e2e5601857b4cb363ba45865e4595bebbc9b8cfa47660a1106b1521b4059d341c7e8c04c0c712387b913bdf994d1c6400')

build() {
  cd "$pkgname-$pkgver"

  sed -i '0,/python/s//python2/' waf
  python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 configure 
  python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 build 
}

package() {
  cd "xiphos-${pkgver}"
  python2 ./waf --destdir=$pkgdir --no-post-install install 
}

