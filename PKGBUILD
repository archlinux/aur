# Contributor: Christopher Bayliss <christopher.j.bayliss@gmail.com>
# co-Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xiphos
pkgver=4.1.0
pkgrel=5
pkgdesc="A Bible study tool for GTK3"
arch=('i686' 'x86_64')
url="http://xiphos.org"
pkgdesc="Bible study tool for GTK+"
url="http://xiphos.org/"
depends=('sword>=1.8.1' 'webkit2gtk' 'libgsf' 'gtkhtml4' 'biblesync<=2.0.0' 'dbus-glib')
makedepends=('gnome-common' 'gnome-doc-utils' 'intltool' 'python2' 'docbook-utils')
license=('GPL')
provides=('gnomesword')
conflicts=('gnomesword')
source=("xiphos-${pkgver}.tar.gz::https://github.com/crosswire/xiphos/archive/${pkgver}.tar.gz" \
	"http://deb.debian.org/debian/pool/main/x/xiphos/xiphos_4.1.0.1+dfsg1-1.debian.tar.xz")
sha512sums=('f2da65a0cf10cda5ca471a09d351be8e2e5601857b4cb363ba45865e4595bebbc9b8cfa47660a1106b1521b4059d341c7e8c04c0c712387b913bdf994d1c6400'
            '7438bc523b8a6d50a2474e43d9057081667436b8292eef9164a5478471e8dc3380f75a84c736ff95ce4ba29bc99588f1a48cf9dfbf5c7c431dd0d53374bfeeb6')

prepare () {
  cd "$pkgname-$pkgver"
  sed -i '0,/python/s//python2/' waf
  patch -Np1 < "$srcdir"/debian/patches/0016*
  patch -Np1 < "$srcdir"/debian/patches/0017*
}

build() {
  cd "$pkgname-$pkgver"


  python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 configure 
  python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 build 
}

package() {
  cd "xiphos-${pkgver}"
  python2 ./waf --destdir=$pkgdir --no-post-install install 
}

