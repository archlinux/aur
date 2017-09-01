# Contributor: Christopher Bayliss <christopher.j.bayliss@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xiphos-gtk3
pkgver=4.0.6
_pkgver=4.0.6a
pkgrel=3
pkgdesc="A Bible study tool - This version is built to use GTK3 and WebKit2GTK+."
arch=('i686' 'x86_64')
url="http://xiphos.org"
license=('GPL')
depends=('webkit2gtk' 'libgsf' 'gconf' 'sword' 'biblesync' 'gtkhtml4' 'festival')
makedepends=('gnome-common' 'gnome-doc-utils' 'intltool' 'python2')
provides=('gnomesword' 'xiphos')
conflicts=('gnomesword' 'xiphos')
source=("xiphos-${_pkgver}.tar.gz::https://github.com/crosswire/xiphos/archive/${_pkgver}.tar.gz")
md5sums=('f1941240e9ffaad57841628935f07306')

build() {
  cd "xiphos-${_pkgver}"
  CXX=g++ python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 configure 
  python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 build 
}

package() {
  cd "xiphos-${_pkgver}"
  python2 ./waf --destdir=$pkgdir --no-post-install install 
}

