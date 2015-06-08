# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-object-signature'
_pkgname='Object-Signature'
pkgver='1.07'
pkgrel='2'
pkgdesc="Generate cryptographic signatures for objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.005')
makedepends=('perl-extutils-makemaker>=6.42')
provides=("object-signature=${pkgver}" "Object::Signature=${pkgver}" "perl-object-signature=${pkgver}")
url="http://search.cpan.org/dist/Object-Signature"
source=("http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/${_pkgname}-${pkgver}.tar.gz")
md5sums=('387fd336d07bd5e74669ec33515c28ef')
sha512sums=('5b48196d0b8833a9864834551f1cfb6499bd25cfd84390146e94ed93c4903394456c3929119f82d9da9002b31ad8acf28bff42b749a5684d00c50b58dbde77a7')

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
