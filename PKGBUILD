# Maintainer: Immae <ismael.bouya@normalesup.org>
# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname='naemon-livestatus'
pkgdesc="Event broker for naemon"
pkgver=1.0.10
pkgrel=1
arch=('i686' 'x86_64')
url="http://naemon.org"
license=('GPL2')
depends=('icu' 'naemon')
source=("naemon-livestatus-git::git+https://github.com/naemon/naemon-livestatus.git#commit=33dbcfe18e42158f25c27cff95a1e07b73be53b0")
sha512sums=('SKIP')
backup=('etc/naemon/livestatus.cfg')

build() {
  cd "$srcdir/$pkgname-git"

  export PKG_CONFIG_PATH="/usr/lib/naemon/pkgconfig:$PKG_CONFIG_PATH"
  ./autogen.sh
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
  cd "$srcdir/$pkgname-git"

  make DESTDIR="$pkgdir" install
}
