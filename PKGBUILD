# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=ganv
pkgver=1.4.0
pkgrel=1
pkgdesc="An interactive Gtkmm canvas widget for graph-based interfaces"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/$pkgname/"
license=('GPL3')
depends=('gtkmm' 'graphviz')
makedepends=('python2')
source=("http://download.drobilla.net/ganv-$pkgver.tar.bz2")
md5sums=('a72fdabc57959cc32065e66b48fea6aa')

prepare() {
  cd $pkgname-$pkgver

  # strip ldconfig
  sed -i '/ldconfig/d' wscript
}

build() {
  cd $pkgname-$pkgver
  python2 waf configure --prefix=/usr
  python2 waf $MAKEFLAGS
}

package() {
  cd $pkgname-$pkgver
  python2 waf install --destdir="$pkgdir"
}
