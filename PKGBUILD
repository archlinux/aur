# Maintainer: John Lane <archlinux at jelmail dot com>
# Previously:: Dale Blount <dale@archlinux.org>

pkgname=spamassassin-spamc
pkgver=3.4.1
pkgrel=1
pkgdesc="Standalone C Client to spamassassin."
arch=('i686' 'x86_64')
url="http://spamassassin.apache.org"
depends=('openssl' 'zlib')
makedepends=('perl-digest-sha1' 'perl-html-parser' 'perl-net-dns' 'perl-netaddr-ip') 
license=('APACHE')
source=(http://www.us.apache.org/dist/spamassassin/source/Mail-SpamAssassin-${pkgver}.tar.gz)
sha256sums=('9b7a95a594cdca4f265707364478b57813b82a0ec7e520d9bc818bfbcafdd726')

build() {
  cd "${srcdir}/Mail-SpamAssassin-${pkgver}"

  /usr/bin/yes n | /usr/bin/perl Makefile.PL CONTACT_ADDRESS=root@localhost \
      ENABLE_SSL=yes PERL_TAINT=no
  make spamc/spamc || return 1
}

package() {
  cd "${srcdir}/Mail-SpamAssassin-${pkgver}"
  mkdir -p $pkgdir/usr/bin || return 1
  install -m755 spamc/spamc ${pkgdir}/usr/bin/ || return 1
}
