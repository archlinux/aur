# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >

pkgname=perl-moosex-emulate-class-accessor-fast
_pkgname=MooseX-Emulate-Class-Accessor-Fast
pkgver=0.009032
pkgrel=1
pkgdesc="Emulate Class::Accessor::Fast behavior using Moose attributes"
arch=(i686 x86_64)
license=('perl')
url="https://metacpan.org/release/MooseX-Emulate-Class-Accessor-Fast"
options=(!emptydirs)
depends=('perl-namespace-clean' 'perl-moose')
makedepends=('perl-test-exception' 'perl')

source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/${_pkgname}-${pkgver}.tar.gz")
md5sums=('3ff00f2ed7a8a23ffaa9f6f93bc73e74')
sha512sums=('3e883364033bc6a453ecc52a47c84b66169a4edc302b9cf9ffff2cb6a4bb3954a075d19bd3dc94415b59205a0e91e6172a8678ea64a851c731c21ddcc6485d08')

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