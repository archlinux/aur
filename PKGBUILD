# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-http'
pkgver='0.18'
pkgrel='1'
pkgdesc="Testing for HTTP services"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-field>=0' 'perl-libwww>=0')
makedepends=()
url='https://metacpan.org/release/Test-HTTP'
source=('https://cpan.metacpan.org/authors/id/L/LU/LUKEC/Test-HTTP-0.18.tar.gz'
        '01-basic.t.diff'
        '10-syntax.t.diff')
md5sums=('5fc15a8c821e13f1c2847aeda14a1a81'
         '29929e60bfda049d74997df7dec94fe9'
         'd791375747975928cf0d7af5313a88d5')
sha512sums=('0a4ce985e213c818ec1be34ccdffe3d78cbbceee3587b88c80ffc59391cc14e2afdaaf38ddb943c84c7fcb80d3709512f9e641b40783cae433e0fe9ed79e6e70'
            'ac90acfbda52fd2619c1cc33d23a62ba8c8039e044402848375c6f6e859ff1f488d51b142099773c2a890081014c217070f4caaf3b2738bbbba48b62c40a65f7'
            'b84b1e8013493cb9fc2bc810a7ab8cf015a8f7decfebc96d6d4e3b3b8cae02010abf86a2c3e9f44cb3d605284e2439167e5075c46a57695491948b9ff5a9a247')
_distdir="Test-HTTP-0.18"

prepare() {
    cd "$_distdir/t"
    patch --forward --strip=1 --input="$srcdir/01-basic.t.diff"
    patch --forward --strip=1 --input="$srcdir/10-syntax.t.diff"
}

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
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
