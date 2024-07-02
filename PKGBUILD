# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-data-validate'
pkgver='0.09'
pkgrel='2'
pkgdesc="common data validation methods"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl')
url='https://metacpan.org/dist/Data-Validate'
source=('https://cpan.metacpan.org/authors/id/S/SO/SONNEN/Data-Validate-0.09.tar.gz')
md5sums=('5f7bbc378e2e16786941335a0d67b423')
sha512sums=('533e4ddce9b060f4f456c8208c1571ad8ade064a6689140b50b672ca7f981bb0bd5c3a59706b0e719ba444634ae4b61fcc4f86ab9ec6be3c74b0265f31c8b30a')
_distdir="Data-Validate-0.09"

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
