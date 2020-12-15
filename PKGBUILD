# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=public-inbox
pkgver=1.6.0
pkgrel=1
pkgdesc='An "archives first" approach to mailing lists'
arch=('any')
url="https://public-inbox.org"
license=('AGPL')
depends=(perl perl-timedate perl-digest-sha perl-email-mime perl-plack perl-uri)
options=('!emptydirs' purge)
# The build system fails if there is no git repo.
source=("$pkgname::git+https://public-inbox.org/#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

# Got tired to figure out the dependencies…
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
