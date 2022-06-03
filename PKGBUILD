# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-pod-eventual'
_distname='Pod-Eventual'
pkgver=0.094002
pkgrel=1
pkgdesc='Read a POD document as a series of trivial events'
arch=('any')
url="https://metacpan.org/dist/${_distname}"
license=('PerlArtistic' 'GPL')
depends=(
  'perl>=5.012'
  'perl-carp'
  'perl-mixin-linewise>=0.102'
)
makedepends=(
  'perl-extutils-makemaker>=6.78'
  'perl-file-path'
)
checkdepends=(
  'perl-perlio-utf8-strict'
  'perl-test-deep'
)
options=('!emptydirs')
_pkgtarname="${_distname}-${pkgver}"
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/${_pkgtarname}.tar.gz")
b2sums=('c59637efc78b5b4360e83608220083e95ae73648e7acfc74a49ec1d66372f33d4540d6063c883405eb8a520284d46c52de21c83c38b59de9d9bd53b629f49389')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL='--skipdeps'                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC='/dev/null'

    cd "${_pkgtarname}"
    /usr/bin/perl Makefile.PL
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
