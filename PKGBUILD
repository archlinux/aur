#! /bin/sh
# Contributor: DerFlob <derflob at derflob dot de>
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>

pkgname=tilda-git
_gitname=tilda
pkgver=5a6496c
pkgrel=1
pkgdesc="Linux terminal based on classic terminals from first person shooter games"
arch=('i686' 'x86_64')
url="https://github.com/lanoxx/tilda"
license=('GPL')
depends=('gtk3' 'vte290' 'glib2' 'confuse' 'libglade')
makedepends=('git')
provides=('tilda')
conflicts=('tilda')

source=('git://github.com/lanoxx/tilda.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  sed -i 's|applications/tilda.png|pixmaps/tilda.png|' "$pkgdir/usr/share/applications/tilda.desktop"
}

# vim:set ts=2 sw=2 et: