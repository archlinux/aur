# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor:  Israel Herraiz <isra@herraiz.org>
# Contributor: jorge_barroso <jorge.barroso.11@gmail.com>
# Contributor: Ray Griffin <rorgoroth@googlemail.com>
# Contributor: Jonathan Wiersma <arch aur at jonw dot org>

pkgname=freeciv-sdl2
_pkgname=freeciv
pkgver=3.0.0
pkgrel=2
pkgdesc="A multiuser clone of the famous Microprose game of Civilization - SDL2 Client"
arch=('i686' 'x86_64')
url="http://freeciv.org"
license=('GPL')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_gfx' 'sdl2_ttf' 'lua53' 'gtk3' 'qt5-base' 'imagemagick' 'lua53')
conflicts=('freeciv' 'freeciv-git')
options=('!libtool')
source=(http://files.freeciv.org/stable/$_pkgname-$pkgver.tar.xz)
sha256sums=('ea2a8782d4fdfef2471e05b74569b4a69cc60a41ab279427860dafdac128a0b2')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --enable-shared --enable-sys-lua \
  --enable-client=sdl2 --enable-fcdb=sqlite3 --enable-aimodules
  make
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -m644 client/org.freeciv.sdl2.desktop "$pkgdir"/usr/share/applications/org.freeciv.sdl2.desktop
}


