# shellcheck disable=SC2034,SC2154
# Maintainer: Jan Hicken <firstname [dot] lastname [at] posteo [dot] de>

pkgname=networkmanager-strongswan
_pkgname=NetworkManager-strongswan
pkgver=1.4.1
pkgrel=1
pkgdesc="Strongswan NetworkManager plugin"
arch=('i686' 'x86_64')
url="http://wiki.strongswan.org/projects/strongswan/wiki/NetworkManager"
license=('GPL')
depends=('networkmanager' 'strongswan>=5.5.1' 'libnm-gtk' 'libsecret')
makedepends=('intltool')
conflicts=('networkmanager-strongswan-passwordstore')
source=("https://download.strongswan.org/NetworkManager/$_pkgname-$pkgver.tar.bz2"{,.sig})
sha256sums=('4877c6bb21867fd6e60081b313cc4ef758910448099ce41b132d804e3243b264'
            'SKIP')
validpgpkeys=('12538F8F689B5F1F15F07BE1765FE26C6B467584') # Tobias Brunner

build() {
  cd "$_pkgname-$pkgver" || exit

  ./configure --sysconfdir=/etc --prefix=/usr \
    --libexecdir=/usr/lib/networkmanager \
    --with-charon=/usr/lib/strongswan/charon-nm
  make
}

check() {
  cd "$_pkgname-$pkgver" || exit
  make check
}

package() {
  cd "$_pkgname-$pkgver" || exit
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
