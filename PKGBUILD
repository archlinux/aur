# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-safe-isa'
_pkgname='Safe-Isa'
pkgver='1.000004'
pkgrel='1'
pkgdesc="Safe::Isa - Call isa, can, does and DOES safely on things that may not be objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=('perl-extutils-makemaker>=6.59')
url='http://search.cpan.org/dist/Safe-Isa'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('6d48d3a7b1aa29f836028588be04e2e729234e57871d431780e5fb9129831806e39ded47ecbd3a3c454337d04db6a3f1d056fd00d1cb2954b59930a41c20f6aa')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
