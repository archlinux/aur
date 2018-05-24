# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=perl-package-anon
pkgver=0.05
pkgrel=2
pkgdesc="Anonymous packages for Perl"
arch=('x86_64' 'i686')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
# Uncomment this if you want to run the testsuit
#makedepends=('perl-sub-exporter')
url='https://metacpan.org/release/Package-Anon'
source=("https://cpan.metacpan.org/authors/id/A/AU/AUGGY/Package-Anon-${pkgver}.tar.gz")
sha512sums=('73adf4eb8348ad51e678d7d777f7c13599eaaa53e776a35df768ee1afcf781801c980c786c658addad80ae5fe852fefb3600722ea7b02d928653543aa28d9d51')

_distdir="Package-Anon-${pkgver}"

build() {
  cd "${srcdir}/${_distdir}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps' \
        perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/${_distdir}"
  if perl -mSub::Exporter -e 42 &>/dev/null; then
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    PERL_MM_USE_DEFAULT='1' make test
  else
    msg2 "Skipping test, because dependency are missing"
  fi
}

package() {
  cd "${srcdir}/${_distdir}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make install DESTDIR="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
