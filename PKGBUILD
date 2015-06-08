# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=perl-moosex-emulate-class-accessor-fast
_pkgname=MooseX-Emulate-Class-Accessor-Fast
pkgver=0.00903
pkgrel=2
pkgdesc="'Emulate Class::Accessor::Fast behavior using Moose attributes'"
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/dist/MooseX-Emulate-Class-Accessor-Fast"
options=(!emptydirs)

depends=('perl-namespace-clean' 'perl-moose')
makedepends=('perl-test-exception' 'perl')

#provides=('MooseX-Emulate-Class-Accessor-Fast')
provides=("moosex-emulate-class-accessor-fast=${pkgver}" "MooseX::Emulate::Class::Accessor::Fast::Meta::Accessor=undef" "perl-moosex-emulate-class-accessor-fast-meta-accessor=undef" "MooseX::Emulate::Class::Accessor::Fast::Meta::Role::Attribute=undef" "perl-moosex-emulate-class-accessor-fast-meta-role-attribute=undef" "MooseX::Emulate::Class::Accessor::Fast=${pkgver}" "perl-moosex-emulate-class-accessor-fast=${pkgver}" "MooseX::Adopt::Class::Accessor::Fast=${pkgver}" "perl-moosex-adopt-class-accessor-fast=${pkgver}")

source=("http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/${_pkgname}-${pkgver}.tar.gz")
md5sums=('edb0d626207e7db61154b5cc65112638')
sha512sums=('5205589b905449855e34c3772a9d18140352fc964a400fda53c0fee63da19116655d992c1bf1bae1bdfea4c2464fc579bb443d878291644152e1b851827897eb')

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

# vim:set ts=2 sw=2 et:

