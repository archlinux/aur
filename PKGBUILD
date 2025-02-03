# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-tcl'
pkgver='1.51'
pkgrel='1'
pkgdesc="Tcl extension module for Perl"
arch=('i686' 'x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('glibc' 'perl' 'tcl')
makedepends=()
url='http://search.cpan.org/dist/Tcl'
source=('http://search.cpan.org/CPAN/authors/id/V/VK/VKON/Tcl-1.51.tar.gz')
md5sums=('9357aa367c9ab63e88e34fb92e1f79d1')
sha512sums=('9caf1819c238a88e9370c405194d2a0a8bd158d2513884a6d18bc271ddab539e7c81af51278bf6cab687d51c295dbe37895a88a595b0b3a1b220d39c0dc6c7ff')
_distdir="Tcl-1.51"

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
