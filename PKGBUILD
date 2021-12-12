# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor:  Israel Herraiz <isra@herraiz.org>
# Contributor: jorge_barroso <jorge.barroso.11@gmail.com>
# Contributor: Ray Griffin <rorgoroth@googlemail.com>
# Contributor: Jonathan Wiersma <arch aur at jonw dot org>

pkgname=freeciv-sdl2
_pkgname=freeciv
pkgver=2.6.6
pkgrel=1
pkgdesc="A multiuser clone of the famous Microprose game of Civilization - SDL2 Client"
arch=('i686' 'x86_64')
url="http://freeciv.org"
license=('GPL')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_gfx' 'sdl2_ttf' 'lua53' 'gtk3' 'qt5-base' 'imagemagick')
conflicts=('freeciv')
options=('!libtool')
source=(http://files.freeciv.org/stable/$_pkgname-$pkgver.tar.bz2)
sha256sums=('7bcfe5dd3c081122e7cde7cdb24f57c3681d6a9667496faed207a91ac3165811')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  ./configure --prefix=/usr --enable-client=sdl2 --enable-shared 
  make
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/etc/freeciv
  mv $pkgdir/usr/etc/freeciv/database.lua $pkgdir/etc/freeciv/database.lua
  rm -rf $pkgdir/usr/etc/
  install -m644 client/org.freeciv.sdl2.desktop "$pkgdir"/usr/share/applications/org.freeciv.sdl2.desktop
}


