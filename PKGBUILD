# maintainer: xeruf <27f at pm dot me>
_pkgname='String-Interpolate-Named'
pkgname=perl-string-interpolate-named
pkgver=1.01
pkgrel=1
pkgdesc="Interpolated named arguments in string"
arch=('any')
license=('unknown')
options=('!emptydirs')
depends=()
url="https://metacpan.org/release/${_pkgname}"
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('c32b2659119a18749a0741c4ff2a7103b5084938b9d07e4d39b2c19de98c8afdbd90953910c4d9fa6a87440eb9f33b53b7c32b7f9a4e2a638aee925ea2443f34')
_distdir="${_pkgname}-${pkgver}"

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
