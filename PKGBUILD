# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-latex-encode
pkgver='0.092.0'
pkgrel='4'
pkgdesc="Encode characters for LaTeX formatting"
arch=(any)
license=('Artistic-2.0')
url="https://metacpan.org/dist/LaTeX-Encode"
depends=('perl-html-parser' 'perl-pod-latex' 'perl-readonly')
makedepends=('perl-carp-always')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/E/EI/EINHVERFR/LaTeX-Encode-${pkgver}.tar.gz")
sha512sums=('6e77a3f48d40f47c20cc08c65eaf9a8635b2fa8b6f3ea403dadace85f2b8bc7e2e7a0834b3d55b0f24ab808ed9d2fa36dafdbcf04670e566b51c8f6a3ffdd144')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/LaTeX-Encode-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
