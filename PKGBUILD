# Maintainer: Jan Hicken <firstname [dot] lastname [at] hotmail [dot] de>

pkgname=networkmanager-strongswan
_pkgname=NetworkManager-strongswan
pkgver=1.4.0
pkgrel=1
pkgdesc="Strongswan NetworkManager plugin"
arch=('i686' 'x86_64')
url="http://wiki.strongswan.org/projects/strongswan/wiki/NetworkManager"
license=('GPL')
depends=('networkmanager' 'strongswan>=5.5.1' 'libnm-gtk')
makedepends=('intltool')
source=("http://download.strongswan.org/NetworkManager/$_pkgname-$pkgver.tar.bz2"{,.sig})
sha256sums=('02680f5226213ec69994b4e0c22229c1d777a3f8eff96a03f79326921ef5d661'
            'SKIP')
validpgpkeys=('12538F8F689B5F1F15F07BE1765FE26C6B467584') # Tobias Brunner

build() {
  cd "$_pkgname-$pkgver"

  ./configure --sysconfdir=/etc --prefix=/usr \
    --libexecdir=/usr/lib/networkmanager \
    --with-charon=/usr/lib/strongswan/charon-nm
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
