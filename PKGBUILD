# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-html-fillinform'
pkgver='2.22'
pkgrel='1'
pkgdesc="Populates HTML Forms with data."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
checkdepends=('perl-cgi' 'perl-html-parser' 'perl-test-output')
url='http://search.cpan.org/dist/HTML-FillInForm'
source=('https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTML-FillInForm-2.22.tar.gz')
md5sums=('2c4f8a31670344e573368c2f54c9e20d')
sha512sums=('ed8c29edd00572fc910487f095c530a4cf5e1e320cab82b171b96e8e490691ef154cb4911c48ffb2d5c726886ec9aca404590e3afd44ca320ad49977822c7db9')
_distdir="HTML-FillInForm-2.22"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
