# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xiphos-git
pkgver=r4065
pkgrel=3
pkgdesc="A Bible study tool -- git version"
arch=('i686' 'x86_64')
url="http://xiphos.org"
license=('GPL')
depends=('webkit2gtk' 'libgsf' 'gconf' 'sword>=1.8.1' 'gtkhtml4' 'biblesync-git')
makedepends=('gnome-common' 'gnome-doc-utils' 'intltool' 'git' 'python2' 'docbook-utils')
provides=('gnomesword' 'xiphos')
conflicts=('gnomesword' 'xiphos')
source=(git+https://github.com/crosswire/xiphos.git)
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s" $(git rev-list --count HEAD)
}

build() {
  cd ${pkgname%-git}
  python2 ./waf --prefix=/usr --enable-webkit2 configure 
  python2 ./waf --prefix=/usr --enable-webkit2 build 
}

package() {
  cd ${pkgname%-git}
  python2 ./waf --destdir="$pkgdir" --no-post-install install 
}
