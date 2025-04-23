# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-catalyst-action-renderview'
pkgver='0.17'
pkgrel='2'
pkgdesc="Sensible default end action."
arch=('any')
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-data-visitor')
makedepends=('perl-module-install')
url='http://search.cpan.org/dist/Catalyst-Action-RenderView'
source=('https://cpan.metacpan.org/authors/id/H/HA/HAARG/Catalyst-Action-RenderView-0.17.tar.gz')
md5sums=('10db546ae9870acd53e43cef21af71ca')
sha512sums=('d8d8d474dacc528c148ac9402bbf4f6759ac21cf6ce659b5d8ef1f8785812ba970196ad1495c84f5616715d42586d88a41863b89fc428a627c766a4817041b3e')
_distdir="Catalyst-Action-RenderView-0.17"

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
