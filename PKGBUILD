# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-compile'
_distname='Test-Compile'
pkgver=3.1.0
pkgrel=1
pkgdesc="Check whether Perl files compile correctly."
arch=('any')
url="https://metacpan.org/release/${_distname}"
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
  'perl>=5.10.0'
  'perl-exporter>=5.68'
  'perl-parent>=0.225'
)
makedepends=(
  'perl-module-build>0.38'
  'perl-version>=0.77'
)
checkdepends=(
  'perl-test-warnings'
  'perl-test-exception'
)
_pkgtarname="${_distname}-v${pkgver}"
source=("https://cpan.metacpan.org/authors/id/E/EG/EGILES/${_pkgtarname}.tar.gz")
b2sums=('d3c6300b43085ed2ba8471a132b24f832b61c9ad2b25fcd407004ce9d3aa0d24060bb89d1c8958c3f705cfed737629bfb6e24ff06730d0cf6fa37cb4a9f0fbf8')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL='--skipdeps'                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC='/dev/null'

    cd "${_pkgtarname}"
    /usr/bin/perl 'Makefile.PL'
    make
  )
}

check() {
  cd "${_pkgtarname}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${_pkgtarname}"
  make install

  find "$pkgdir" -name '.packlist' -o -name 'perllocal.pod' -delete
}
