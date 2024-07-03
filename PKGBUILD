# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-tcl'
pkgver='1.32'
pkgrel='5'
pkgdesc="Tcl extension module for Perl"
arch=('i686' 'x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('glibc' 'perl>=5.006' 'tcl')
makedepends=()
url='http://search.cpan.org/dist/Tcl'
source=('http://search.cpan.org/CPAN/authors/id/V/VK/VKON/Tcl-1.32.tar.gz')
md5sums=('34415b3624cd38dcc4ab919a0369713c')
sha512sums=('363ae39b0d110718e56606ea89432c5c749b077d7adc1fef2f0beeaccc8ac3fe23a37f743331a06d7c1cdb1c161a1a3800a5875d7f03549c05ae63e536b85bbc')
_distdir="Tcl-1.32"

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
