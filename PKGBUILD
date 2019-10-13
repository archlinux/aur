# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=public-inbox
pkgver=1.1.0pre1
_pkgver=1.1.0-pre1
pkgrel=1
pkgdesc='An "archives first" approach to mailing lists'
arch=('any')
url="https://public-inbox.org"
license=('AGPL')
depends=(perl perl-timedate perl-digest-sha perl-email-mime perl-plack perl-uri)
options=('!emptydirs' purge)
source=("$pkgname::git+https://public-inbox.org/#tag=v$_pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

# check() {
#   cd "$srcdir/$pkgname"
#   unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
#   export PERL_MM_USE_DEFAULT=1
#   make test
# }

package() {
  cd "$srcdir/$pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
