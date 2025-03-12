# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-pod-latex
pkgver='0.61'
pkgrel='4'
pkgdesc="Convert Pod data to formatted LaTeX"
arch=(any)
license=('Artistic-2.0')
url="https://metacpan.org/dist/Pod-LaTeX"
options=('!emptydirs')
depends=('perl')
makedepends=('perl-module-build')
source=("http://search.cpan.org/CPAN/authors/id/T/TJ/TJENNESS/Pod-LaTeX-${pkgver}.tar.gz")
sha512sums=('c9b5d8b50f630e25e1f913d95d83a1323e71d2c5a3a794a543bdc9962800e5979b3e58595e7a653a96f9aea1f321c1564e2062e9b9d70d8c4d1c6729cb8df498')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Pod-LaTeX-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  prepare_environment
  ./Build test
}

package() {
  prepare_environment
  ./Build install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
