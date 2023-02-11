# Maintainer: modula t. <defaultxr at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=lv2-c++-tools
pkgver=1.0.7
pkgrel=1
pkgdesc="Tools and libraries that may come in handy when writing LV2 plugins."
arch=('i686' 'x86_64')
url="http://ll-plugins.nongnu.org/hacking.html"
license=('GPL3')
makedepends=('boost')
options=('staticlibs')
source=("https://download-mirror.savannah.gnu.org/releases/ll-plugins/$pkgname-$pkgver.tar.bz2")
md5sums=('464955e219a87b27b5e951e1b37c68fe')


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
