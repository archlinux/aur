# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-tcl'
pkgver='1.53'
pkgrel='1'
pkgdesc="Tcl extension module for Perl"
arch=('i686' 'x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('glibc' 'perl' 'tcl')
makedepends=()
url='http://search.cpan.org/dist/Tcl'
source=('http://search.cpan.org/CPAN/authors/id/V/VK/VKON/Tcl-1.53.tar.gz')
md5sums=('d4e172f9d66c713ec3ced5929bd7fbf3')
sha512sums=('6f528dcaaf8e00a9c5461f93ef235de2d2028e61edd6a101b05cadc04260b8262b1bfbe9dae8a51168daf30cf0b9e73e5548e136e8cffbf38dfbc8667d6c2a30')
_distdir="Tcl-1.53"

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
