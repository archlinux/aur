# Maintainer : Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Jan Hicken <firstname [dot] lastname [at] posteo [dot] de>

pkgname=networkmanager-strongswan
_pkgname=NetworkManager-strongswan
pkgver=1.4.2
pkgrel=2
pkgdesc="Strongswan NetworkManager plugin"
arch=('i686' 'x86_64')
url="http://wiki.strongswan.org/projects/strongswan/wiki/NetworkManager"
license=('GPL')
depends=('networkmanager' 'strongswan>=5.5.1' 'libnm-gtk' 'libsecret')
makedepends=('intltool')
source=("https://download.strongswan.org/NetworkManager/$_pkgname-$pkgver.tar.bz2"{,.sig})
sha512sums=('b62790d9cee12bed24c50762c2624654268244c8a1d5d42f184f78316e651dd8d450096bd9652699686c307d0ffbe8a328a151e3430755cf40a1d1de7a1525e8'
            'SKIP')
validpgpkeys=('12538F8F689B5F1F15F07BE1765FE26C6B467584') # Tobias Brunner

build() {
  cd "$_pkgname-$pkgver"
  ./configure --sysconfdir=/etc --prefix=/usr \
    --libexecdir=/usr/lib/networkmanager \
    --with-charon=/usr/lib/strongswan/charon-nm
  make
}

check() {
  cd "$_pkgname-$pkgver"
  make check
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
