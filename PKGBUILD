# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-template-alloy'
pkgver='1.022'
pkgrel='2'
pkgdesc="TT2/3, HT, HTE, Tmpl, and Velocity Engine"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl')
url='https://metacpan.org/dist/Template-Alloy'
source=('https://cpan.metacpan.org/authors/id/R/RH/RHANDOM/Template-Alloy-1.022.tar.gz')
md5sums=('e36561886e0abe39b88c4a35aca75e23')
sha512sums=('deed5702022f62ea75f4eefff7ed9c873b0b09e148af10ad7d5030d69a755979b0fbc56e8291fdb8e26555a41912cfe2c74ee0bf3d3ed0ef67340eb1e39f3c28')
_distdir="Template-Alloy-1.022"

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
