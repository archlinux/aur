#
# PKGBUILD for cone
#
# This version has no dependencies to other courier libraries.
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=cone-simple
pkgver=0.90
pkgrel=1
epoch=
pkgdesc="Curses text-based mail client - handles multiple POP3, IMAP accounts, and local mail folders. contains a simple newsreader. This version has no dependencies to other courier libraries."
arch=('i686', 'x86_64')
url="http://courier-mta.org/cone/"
license=('GPL2')
groups=()
depends=('libxml2' 'libidn' 'libldap' 'gamin' 'aspell')
makedepends=('configure')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://sourceforge.net/projects/courier/files/cone/$pkgver/cone-$pkgver.tar.bz2)
noextract=()
md5sums=('fce2ff83bef7294aca7caffa20090a6b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  #patch -p1 -i "$srcdir/fastforward-cc-conf.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  "$srcdir/$pkgname-$pkgver/configure" -C --without-db --with-certdb=/usr/share/cone/rootcerts --prefix=/usr --exec-prefix=/usr --libexecdir=/usr/lib/cone --sysconfdir=/etc
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# EOF
