# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-string-trim'
pkgver='0.005'
pkgrel='2'
pkgdesc='trim whitespace from your strings'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=()
url='https://metacpan.org/pod/String::Trim'
source=('https://cpan.metacpan.org/authors/id/D/DO/DOHERTY/String-Trim-0.005.tar.gz')
md5sums=('87f4beb20804b5ce2bae083d98f619f1')
sha512sums=('74530f7a69cd71d38b86742e5cd5bf4c8fe2675dcafe58ebde032ab7ac2b82fea098a831f51d4d80b8eea6cfd58a3362f27037145ed1b0b4744fe1ab5b8913f9')
_distdir="String-Trim-0.005"

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
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
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
