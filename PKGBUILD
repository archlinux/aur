# Maintainer: modula t. <defaultxr at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=lv2-c++-tools
pkgver=1.0.5
pkgrel=3
pkgdesc="Tools and libraries that may come in handy when writing LV2 plugins."
arch=('i686' 'x86_64')
url="http://ll-plugins.nongnu.org/hacking.html"
license=('GPL3')
makedepends=('boost')
options=('staticlibs')
source=("https://download-mirror.savannah.gnu.org/releases/ll-plugins/$pkgname-$pkgver.tar.bz2")
md5sums=('4707f2507f86d6c7bbaa809bb52eed9b')


prepare() {
    cd $pkgname-$pkgver

    # do not call ldconfig
    sed -i '/ldconfig/d' Makefile.template
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
