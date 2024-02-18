# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Michał Wojdyła <micwoj9292@gmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname='Time-Duration-Parse'
pkgname="perl-${_distname@L}"
pkgver='0.16'
pkgrel='2'
pkgdesc="Parse string that represents time duration"
arch=('any')
license=('LicenseRef-GPL-1.0-or-later OR Artistic-1.0-Perl')
options=('!emptydirs')
depends=('perl')
checkdepends=('perl-time-duration')
url="https://metacpan.org/release/$_distname"
_author='NEILB'
source=("https://search.cpan.org/CPAN/authors/id/${_author::1}/${_author::2}/$_author/$_distname-$pkgver.tar.gz")
sha512sums=('947c7ce0a1a013c86b3c9e464e4c56bb0cc98572c3854d9b6ab33e8dac2270982b72efcd5e2601490e5a23104543ac343033f06294eb88282d0473378117faed')
_distdir="$_distname-$pkgver"

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
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
