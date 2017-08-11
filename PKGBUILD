# Contributor: Christopher Bayliss <christopher.j.bayliss@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xiphos-gtk3
pkgver=4.0.6
pkgrel=1
pkgdesc="A Bible study tool - This version is built to use GTK3 and WebKit2GTK+."
arch=('i686' 'x86_64')
url="http://xiphos.org"
license=('GPL')
depends=('webkit2gtk' 'libgsf' 'gconf' 'sword' 'biblesync' 'gtkhtml4' 'festival')
makedepends=('gnome-common' 'gnome-doc-utils' 'intltool' 'subversion')
provides=('gnomesword' 'xiphos' 'xiphos-svn')
conflicts=('gnomesword' 'xiphos' 'xiphos-svn')
source=("https://github.com/crosswire/xiphos/releases/download/$pkgver/xiphos-$pkgver-20170810.tar.gz")
sha512sums=('a7e645c2aa6f098c4888d63d3bbfa57009924d9594e89fd003d9ab47c03e25571e8a982ac640c29be02412d10baad08ff51b2bd25807d3a4a7b3abba16c9112a')

build() {
  cd "$srcdir/xiphos-$pkgver"
  CXX=g++ python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 configure 
  python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 build 
}

package() {
  cd "$srcdir/xiphos-$pkgver"
  python2 ./waf --destdir=$pkgdir --no-post-install install 
}

