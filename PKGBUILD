# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-module-signature'
pkgver='0.88'
pkgrel='2'
pkgdesc="Module signature file manipulation"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later' 'CC0-1.0')
options=('!emptydirs')
depends=('perl>=5.005')
makedepends=('perl-ipc-run')
url='https://metacpan.org/dist/Module-Signature'
source=('https://cpan.metacpan.org/authors/id/A/AU/AUDREYT/Module-Signature-0.88.tar.gz')
md5sums=('af534a2d5cb4dd55e4cc1ded88d97e77')
sha512sums=('624d7508b7854e05c50915b9192552fddd17e22043f2b330c02c34ad44dd01cb0ffd657fcd4e5333324b2ce9a05e044772e80c3ae061608f91d8101d00b3666c')
_distdir="Module-Signature-0.88"

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
