# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-module-runtime-conflicts'
_distname='Module-Runtime-Conflicts'
_distauthor='ETHER'
pkgver=0.003
pkgrel=2
pkgdesc='Provide information on conflicts for Module::Runtime'
arch=('any')
url="https://metacpan.org/release/${_distname}"
license=('PerlArtistic' 'GPL')
depends=(
  'perl'
  'perl-dist-checkconflicts'
  'perl-module-runtime'
)
makedepends=(
  'perl-extutils-makemaker'
  'perl-module-metadata'
  'perl-pathtools'
  'perl-test-simple'
)
checkdepends=(
  'perl-pod-coverage'
)
options=('!emptydirs')
_tarname="${_distname}-${pkgver}"
source=("${_tarname}.tar.gz::https://cpan.metacpan.org/authors/id/${_distauthor::1}/${_distauthor::2}/${_distauthor}/${_tarname}.tar.gz")
b2sums=('f67a6647ef8a55e2de845f9cfc004f12bb2a813843f70d1aa0cc53912f385d6dae884ae0a12f81d69039d810d0ea306cbfab6bfba913c4eb2583c77d4a075aa6')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL='--skipdeps'                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
      MODULEBUILDRC='/dev/null'

    cd "${_tarname}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${_tarname}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${_tarname}"
  make install

  find "${pkgdir}" -name '.packlist' -o -name 'perllocal.pod' -delete
}
