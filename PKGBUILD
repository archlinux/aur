# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Nicolás Reynolds <fauno@kiwwwi.com.ar>
# Contributor (Arch): Nathan Owe <ndowens04 at gmail>
pkgname=anubis
pkgver=4.3
pkgrel=1
pkgdesc="An SMTP message submission daemon. "
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/anubis/"
license=('GPL3')
depends=('guile' 'gpgme' 'gnutls' 'gsasl' 'pam' 'pcre')
makedepends=('libmariadbclient') # 'postgresql-libs')
source=(ftp://ftp.gnu.org/gnu/anubis/$pkgname-$pkgver.tar.gz)
md5sums=('bc80b9045b3c8f3b1d6798200cd81586')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --with-guile \
              --with-pam \
              --with-mysql \
              --with-pcre \
              --without-tcp-wrappers \
              --with-socks-proxy
#--with-postgres disable for now, some include error

  # For some reason the GUILE_INCLUDES variable is set but not used
  # during build.
  make CFLAGS="$CFLAGS $(guile-config compile)"
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}

# vim:set ts=2 sw=2 et:
