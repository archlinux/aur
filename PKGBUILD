# Maintainer: Vonpupp <vonpupp@gmail.com>
# Contributor: Menche <menche_mt at yahoo dot com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Andrea Scarpino
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: TripleE <eric1548@yahoo.com>

pkgname=xiphos
pkgver=4.0.7
pkgrel=1
_pkgdate=20170924
pkgdesc="Bible study tool for GTK+"
arch=('x86_64' 'i686')
url="http://xiphos.org/"
depends=('sword' 'webkitgtk2' 'libgsf' 'libglade' 'gtkhtml4' 'biblesync')
makedepends=('gnome-doc-utils' 'intltool' 'python2')
license=('GPL')
conflicts=('gnomesword')
provides=('gnomesword')
replaces=('gnomesword')
install=xiphos.install
source=("https://github.com/crosswire/xiphos/releases/download/$pkgver/$pkgname-$pkgver-$_pkgdate.tar.gz")
sha512sums=('041e0e9c6a7406b02c5b45066b44a3d44c37a34a799c3dfd617b6aa52dc50efbf800e475e107108fcf1d0d23a3522d0a9fa0838c474d2e4dd39f3af9d3429bd4')

build() {
  cd "$pkgname-$pkgver"

  sed -i '0,/python/s//python2/' waf
  ./waf configure --gtk=3 --prefix=/usr --enable-webkit2
  ./waf build
}

package() {
  cd "$pkgname-$pkgver"

  ./waf install --destdir="$pkgdir"
}
