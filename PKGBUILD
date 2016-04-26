# Maintainer: xRemaLx <anton.komolov@gmail.com>
# Contributor: Ben Webb <bjwebb67 at googlemail dot com>

pkgname=perl-dbix-contextualfetch
_pkgname='DBIx-ContextualFetch'
pkgver=1.03
pkgrel=2
pkgdesc="Add contextual fetches to DBI"
arch=(any)
license=('GPL' 'PerlArtistic')
options=(!emptydirs)
depends=('perl>=5.10.0' 'perl-dbi')
makedepends=()
url="http://search.cpan.org/dist/DBIx-ContextualFetch/"
source=("http://search.cpan.org/CPAN/authors/id/T/TM/TMTM/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('e563bb56026bc8f15ced939696caaa1532aa71def6603cf3e941016a1337ca090053e30c582623413af50008ea8f4c62981cb94a4f75d423d53d015300c66885')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
