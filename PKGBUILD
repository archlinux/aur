# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-parse-mime'
pkgver='1.005'
pkgrel='1'
pkgdesc='Parse mime-types, match against media ranges'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=()
url='https://metacpan.org/pod/Parse::MIME'
source=('https://cpan.metacpan.org/authors/id/A/AR/ARISTOTLE/Parse-MIME-1.005.tar.gz')
md5sums=('b767c6eaddaa7402b8810f0ea5c19bc9')
sha512sums=('e07caf6ada43c24f3db85fa713088214fcd1c8a5fb3dd6e95764291c69060ffc12e3c8053f6950aea1d85bae01bec786ca27172e392d833d6b3335cbc0dd4777')
_distdir="Parse-MIME-1.005"

build() {
   export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
