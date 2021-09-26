# Maintainer: John Lane <archlinux at jelmail dot com>
# Previously:: Dale Blount <dale@archlinux.org>

pkgname=spamassassin-spamc
pkgver=3.4.6
pkgrel=1
pkgdesc="Standalone C Client to spamassassin."
arch=('i686' 'x86_64')
url="http://spamassassin.apache.org"
depends=('openssl' 'zlib')
makedepends=('perl-digest-sha1' 'perl-html-parser' 'perl-net-dns' 'perl-netaddr-ip') 
license=('APACHE')
source=(http://dlcdn.apache.org/spamassassin/source/Mail-SpamAssassin-${pkgver}.tar.gz)
sha256sums=('500c7e2a7cdf3aa4dd822d97aaff2ab22235a60cf17a68ab817861d215a4e568')

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
