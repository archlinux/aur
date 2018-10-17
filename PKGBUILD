# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=perl-cbor-xs
pkgver=1.7
pkgrel=1
pkgdesc="Concise Binary Object Representation"
arch=('x86_64' 'i686')
license=('GPL')
options=('!emptydirs')
depends=('perl' 'perl-types-serialiser' 'perl-common-sense')
url='https://metacpan.org/release/CBOR-XS'
source=("https://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/CBOR-XS-${pkgver}.tar.gz"
        "kill-canary.patch")
sha512sums=('13f5a0db0e983929fe7a670caf23ef130ed18f1974cf471d77d20e9e5d78c8afcad9a3440f198906d8e30625da7f8cb1d3a8919fd896442101f3865f0af5614c'
            '930bea1d5cfad6bfdf09db9a6532ce4eb584adda3182d34d00f547bc918a0c9eb7cefbd2ace5a8eb7acda9275f4143961b0581747d6cc795988891e99c638ead')

_distdir="CBOR-XS-${pkgver}"

prepare() {
  cd "${srcdir}/${_distdir}"
  patch -p1 <"${srcdir}/kill-canary.patch"
}

build() {
  cd "${srcdir}/${_distdir}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'
  perl Makefile.PL INSTALLDIRS='vendor'
  make
}

check() {
  cd "${srcdir}/${_distdir}"
  make test
}

package() {
  cd "${srcdir}/${_distdir}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make install DESTDIR="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
