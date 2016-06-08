#! /bin/bash
# Maintainer:  Israel Herraiz <isra@herraiz.org>
# Contributor: jorge_barroso <jorge.barroso.11@gmail.com>
# Contributor: Ray Griffin <rorgoroth@googlemail.com>
# Contributor: Jonathan Wiersma <arch aur at jonw dot org>

pkgname=freeciv-sdl
_pkgname=freeciv
pkgver=2.5.3
pkgrel=1
pkgdesc="A multiuser clone of the famous Microprose game of Civilization - SDL Client"
arch=('i686' 'x86_64')
url="http://freeciv.org"
license=('GPL')
depends=('gtk2' 'hicolor-icon-theme' 'sdl_image' 'sdl_mixer' 'sdl_gfx' 'sdl_ttf')
conflicts=('freeciv')
options=('!libtool')
install=$_pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.bz2)
sha512sums=('a3e1ee5f585be062ec5fc7783dfe24f4cd313bea016af47b868e01561fc3958a86ed310edd41130fc5ede6ca2547ca38198c8dbb18974db7d14defd103277b4b')

build() {
  cd "$srcdir"/$_pkgname-$pkgver

  ./configure --prefix=/usr --enable-client=sdl --enable-shared --without-ggz-client

  make

  sed 's/gtk2/sdl/g' -i client/$_pkgname.desktop
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -m644 client/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
}
