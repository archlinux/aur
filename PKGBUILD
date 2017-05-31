# shellcheck disable=SC2034,SC2154
# Maintainer: Jan Hicken <firstname [dot] lastname [at] posteo [dot] de>

pkgname=networkmanager-strongswan
_pkgname=NetworkManager-strongswan
pkgver=1.4.2
pkgrel=1
pkgdesc="Strongswan NetworkManager plugin"
arch=('i686' 'x86_64')
url="http://wiki.strongswan.org/projects/strongswan/wiki/NetworkManager"
license=('GPL')
depends=('networkmanager' 'strongswan>=5.5.1' 'libnm-gtk' 'libsecret')
makedepends=('intltool')
conflicts=('networkmanager-strongswan-passwordstore')
source=("https://download.strongswan.org/NetworkManager/$_pkgname-$pkgver.tar.bz2"{,.sig})
sha256sums=('f7cdeca25ae8269cb4e7be47128336e67179b4a46e8bf09f9ae47fd0bcdb2f74'
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
