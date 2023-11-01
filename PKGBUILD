# Contributor: dreieck
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-compile'
_distname='Test-Compile'
pkgver=3.3.1
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
b2sums=('5a1b52447eb8e1f92903e3eae09f3b91fef4ba9bb7962edc854629a730dc8c0e622aaf78a13e6ec26a002749cfd9d112f4d2aa33acfb6a2775ce5b77a026ff04')
options+=('emptydirs')

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
