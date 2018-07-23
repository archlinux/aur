# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor:  Israel Herraiz <isra@herraiz.org>
# Contributor: jorge_barroso <jorge.barroso.11@gmail.com>
# Contributor: Ray Griffin <rorgoroth@googlemail.com>
# Contributor: Jonathan Wiersma <arch aur at jonw dot org>

pkgname=freeciv-sdl
_pkgname=freeciv
pkgver=2.6.0
pkgrel=1
pkgdesc="A multiuser clone of the famous Microprose game of Civilization - SDL2 Client"
arch=('i686' 'x86_64')
url="http://freeciv.org"
license=('GPL')
depends=('hicolor-icon-theme' 'sdl2_image' 'sdl2_mixer' 'sdl2_gfx' 'sdl2_ttf')
conflicts=('freeciv')
options=('!libtool')
install=$_pkgname.install
source=(http://files.freeciv.org/stable/$_pkgname-$pkgver.tar.bz2)
sha256sums=('7c20399198d6c7d846fed9a69b02e01134ae5340a3ae0f99d1e38063ade6c999')

build() {
  cd "$srcdir"/$_pkgname-$pkgver

  ./configure --prefix=/usr --enable-client=sdl2 --enable-shared --without-ggz-client

  make

  sed 's/gtk2/sdl2/g' -i client/$_pkgname.desktop
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -m644 client/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
}


