# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: ekse <ekse.0x[AT]gmail[DOT]com>
# Maintainer: mirandir <mirandir[AT]orange[DOT]fr>

pkgname=jumpnbump
pkgver=1.55
pkgrel=5
pkgdesc="You, as a bunny, have to jump on your opponents to make them explode. It's a true multiplayer game which can't be played alone. It has network support. This program is a Unix port of the old DOS game by brainchilddesign."
arch=('i686' 'x86_64')
url="http://freecode.com/projects/jumpnbump"
license=('GPL')
depends=('sdl_mixer' 'sdl_net')
optdepends=('jumpnbump-levels: more levels for jumpnbump' 'jumpnbump-menu: a launcher for jumpnbump')
source=("http://mirandir.pagesperso-orange.fr/files/${pkgname}-${pkgver}.tar.gz" "jnb.patch")
sha256sums=('95e9ec8c3148a996bd46ffea21393aa0e0868706325d5947bc932b4ba46eafcf'
            '16d4363944d8279e7da77588085f7c103afa743f977c1ea9c742959f6140253d')

build() {
  cd "${srcdir}/${pkgname}-1.50/sdl/"
  patch -lp0 < ../../jnb.patch || return 1

  cd "${srcdir}/${pkgname}-1.50"
  
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-1.50"
  make DESTDIR="${pkgdir}" install
}
