# Maintainer: xeruf <27jf at pm dot me>
_pkgname='String-Interpolate-Named'
pkgname=perl-string-interpolate-named
pkgver=1.03
pkgrel=1
pkgdesc="Interpolated named arguments in string"
arch=('any')
license=('unknown')
options=('!emptydirs')
depends=()
url="https://metacpan.org/release/${_pkgname}"
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('07bdcb0dbb585bfb1534571ab9eaae027251dc1a1b7f94cf4bd3386f9f542870acdf77c39dd4a6d8a7c5670c1d23319fe733e5fbe99111e5ea0b3100cf99c6fc')
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
