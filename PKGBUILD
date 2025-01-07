# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-tcl'
pkgver='1.50'
pkgrel='1'
pkgdesc="Tcl extension module for Perl"
arch=('i686' 'x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('glibc' 'perl' 'tcl')
makedepends=()
url='http://search.cpan.org/dist/Tcl'
source=('http://search.cpan.org/CPAN/authors/id/V/VK/VKON/Tcl-1.50.tar.gz')
md5sums=('acc9553124075dc9a9e687bf96ea30f3')
sha512sums=('12ad56aea9158722cb7d6f178c5b37a8deba0581500d5ca9cfc38ab42b32558540444a12c67f6ace2e03cc70146224e7209b4fbafd6472a7ab2e0c9b47eb2fcd')
_distdir="Tcl-1.50"

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
  # set the library to be root-writable so it can be stripped
  chmod 755 "$pkgdir"/usr/lib/perl*/*/vendor_perl/auto/Tcl/Tcl.so
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
