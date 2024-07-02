# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-text-microtemplate'
pkgver='0.24'
pkgrel='3'
pkgdesc="Micro template engine with Perl5 language"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=5.8.0')
makedepends=('perl-module-install')
checkdepends=('perl-io-stringy')
url='https://metacpan.org/dist/Text-MicroTemplate'
source=('https://cpan.metacpan.org/authors/id/K/KA/KAZUHO/Text-MicroTemplate-0.24.tar.gz')
md5sums=('8dcce521bace009b87a30a445da15000')
sha512sums=('5a024cf2a1a20131d823fadf8e5e7575a694e69ba73d9f96ff9151eab36f62278896c030b7f78b0665ad49c1b2afaff34aae06f16f37dd8d65e301cb950d4a05')
_distdir="Text-MicroTemplate-0.24"

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
