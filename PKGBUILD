# Maintainer: Immae <ismael.bouya@normalesup.org>
# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname='naemon-livestatus'
pkgdesc="Event broker for naemon"
pkgver=1.0.9
pkgrel=1
arch=('i686' 'x86_64')
url="http://naemon.org"
license=('GPL2')
depends=('icu' 'naemon')
source=(http://labs.consol.de/naemon/release/v$pkgver/src/$pkgname-$pkgver.tar.gz)
sha512sums=('110b92914f687477ecd803218b141d8e7cf28de7ce72dc4168e3c6faedab1b3446dd9a81698ef9f80f38969e73b8488341f20cfd9c09856ad76a850685970b4f')
backup=('etc/naemon/livestatus.cfg')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export PKG_CONFIG_PATH="/usr/lib/naemon/pkgconfig:$PKG_CONFIG_PATH"
  ./configure --prefix=/usr \
              --bindir=/usr/bin \
              --datadir="/usr/share/naemon" \
              --libdir="/usr/lib/naemon" \
              --localstatedir="/var/lib/naemon" \
              --sysconfdir="/etc/naemon" \
              --mandir="/usr/share/man"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
