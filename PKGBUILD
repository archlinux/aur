# Maintainer : David Phillips <sighup.nz>
# Contributor: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: tobias [tobias [at] archlinux.org]
# Contributor: Tom Vincent <http://www.tlvince.com/contact/>

pkgname=mutt-kiss
pkgver=1.13.5
pkgrel=1
pkgdesc="Small but very powerful text-based mail client. Sans POP/IMAP/SMTP/SSL"
arch=('i686' 'x86_64')
url="http://www.mutt.org/"
license=('GPL')
depends=('gpgme' 'libidn2' 'ncurses')
provides=('mutt')
conflicts=('mutt')
backup=('etc/Muttrc')
install=$pkgname.install
source=("http://ftp.mutt.org/pub/mutt/mutt-${pkgver}.tar.gz"{,.asc})
sha256sums=('6cd71b5b3e6b255afef6bed3b5e1e8ee9819b3d7c9839fd95e798045882aa653'
            'SKIP')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA')

build() {
  cd "$srcdir/mutt-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gpgme \
    --enable-hcache \
    --with-curses=/usr \
    --with-regex \
    --disable-pop \
    --disable-imap \
    --disable-smtp \
    --enable-sidebar \
    --with-idn2 \

  make
}

package() {
  cd "$srcdir/mutt-$pkgver"
  make DESTDIR="$pkgdir" install

  rm "$pkgdir"/etc/mime.types{,.dist}
  install -Dm644 contrib/gpg.rc "$pkgdir/etc/Muttrc.gpg.dist"
}

# vim:set ts=2 sw=2 et:
