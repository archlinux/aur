# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-mixin-extrafields'
pkgver='0.140003'
pkgrel='1'
pkgdesc="add extra stashes of data to your objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-string-rewriteprefix>=0' 'perl-sub-exporter>=0.972' 'perl-sub-install>=0')
makedepends=()
url='http://search.cpan.org/dist/Mixin-ExtraFields'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Mixin-ExtraFields-0.140003.tar.gz')
md5sums=('3a7fba4a005ddf6c45a251e916bd1197')
_distdir="Mixin-ExtraFields-0.140003"

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
