# Maintainer: Amish <contact at via dot aur>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-text-csv-xs
pkgver=1.52
pkgrel=1
pkgdesc="Comma-separated values manipulation routines"
_dist=Text-CSV_XS
arch=('i686' 'x86_64')
url="https://metacpan.org/release/${_dist}"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/${_dist}-${pkgver}.tgz")
sha512sums=('39309d25ce598ab312a70e50a449eb110807d2dd7b02b87502c96c31f0375641d35e3c27eb8faebb25d3816372d518044686a4d73195170d53eb9dc993797658')

build() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
