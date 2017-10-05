# Contributor: Christopher Bayliss <christopher.j.bayliss@gmail.com>
# co-Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xiphos
pkgver=4.0.7
pkgrel=1
pkgdesc="A Bible study tool for GTK3"
arch=('i686' 'x86_64')
url="http://xiphos.org"
pkgdesc="Bible study tool for GTK+"
arch=('x86_64' 'i686')
url="http://xiphos.org/"
depends=('sword' 'webkit2gtk' 'libgsf' 'libglade' 'gtkhtml4' 'biblesync')
makedepends=('gnome-common' 'gnome-doc-utils' 'intltool' 'python2')
license=('GPL')
provides=('gnomesword')
conflicts=('gnomesword')
source=("xiphos-${pkgver}.tar.gz::https://github.com/crosswire/xiphos/archive/${pkgver}.tar.gz")
sha512sums=('041e0e9c6a7406b02c5b45066b44a3d44c37a34a799c3dfd617b6aa52dc50efbf800e475e107108fcf1d0d23a3522d0a9fa0838c474d2e4dd39f3af9d3429bd4')

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

