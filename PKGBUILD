# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=ganv
pkgver=1.4.2
pkgrel=1
pkgdesc="An interactive Gtkmm canvas widget for graph-based interfaces"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/$pkgname/"
license=('GPL3')
depends=('gtkmm' 'graphviz')
makedepends=('python2')
source=("http://download.drobilla.net/ganv-$pkgver.tar.bz2")
md5sums=('30c2c36d0c64d0a3b73e0bc7c564861c')

prepare() {
  cd $pkgname-$pkgver

  # strip ldconfig
  sed -i '/ldconfig/d' wscript
}

build() {
  cd $pkgname-$pkgver
  CXXFLAGS+=' -std=c++11'
  python2 waf configure --prefix=/usr
  python2 waf $MAKEFLAGS
}

package() {
  cd $pkgname-$pkgver
  python2 waf install --destdir="$pkgdir"
}
