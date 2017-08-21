# Contributor: Christopher Bayliss <christopher.j.bayliss@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xiphos-gtk3
pkgver=4.0.6
_pkgver=4.0.6a
pkgrel=2
pkgdesc="A Bible study tool - This version is built to use GTK3 and WebKit2GTK+."
arch=('i686' 'x86_64')
url="http://xiphos.org"
license=('GPL')
depends=('webkit2gtk' 'libgsf' 'gconf' 'sword' 'biblesync' 'gtkhtml4' 'festival')
makedepends=('gnome-common' 'gnome-doc-utils' 'intltool' 'python2')
provides=('gnomesword' 'xiphos')
conflicts=('gnomesword' 'xiphos')
source=("https://github.com/crosswire/xiphos/releases/download/$pkgver/xiphos-${_pkgver}-20170820.tar.gz")
sha512sums=('a0577521c6b9033b74b3b0a0fd7a88222de00dc2e9db100d66e1bb60bc117173badd26c47d2e896ffa167c52a263c9bf9046d650a9b4ae497bec6164bfb0a29b')

build() {
  cd "xiphos-${_pkgver}"
  CXX=g++ python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 configure 
  python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 build 
}

package() {
  cd "xiphos-${_pkgver}"
  python2 ./waf --destdir=$pkgdir --no-post-install install 
}

