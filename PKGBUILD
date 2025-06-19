# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Immae <ismael.bouya@normalesup.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>

pkgname='naemon-livestatus'
pkgdesc="Naemon - Livestatus Eventbroker Module"
pkgver=1.4.4
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.naemon.io/documentation/usersguide/livestatus.html"
license=('GPL2')
depends=('icu' 'naemon')
makedepends=('git')
source=("naemon-livestatus-git::git+https://github.com/naemon/naemon-livestatus.git#commit=73d41450ec878209aa01066d49be812eba7fabe6")
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
