# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-checkmanifest'
_distname='Test-CheckManifest'
pkgver=1.42
pkgrel=1
pkgdesc='Check if your Manifest matches your distro'
arch=('any')
url="https://metacpan.org/dist/${_distname}"
license=('Artistic2.0')
depends=(
  'perl>=5.008'
  'perl-carp'
  'perl-data-dumper'
  'perl-pathtools>=3.75'
  'perl-scalar-list-utils'
  'perl-test-simple'
)
makedepends=(
  'perl-cpan-meta-yaml'
  'perl-extutils-makemaker'
  'perl-file-path'
  'perl-io'
  'perl-pod-coverage-trustpod'
)
options=('!emptydirs')
_pkgtarname="${_distname}-${pkgver}"
source=("https://cpan.metacpan.org/authors/id/R/RE/RENEEB/${_pkgtarname}.tar.gz")
b2sums=('10d20fefee1dc61cb172c8565d16da8072c0560c155e366f9ba52e6e6f10eb24c7cc3b71d40e2dcf6cf085de04731bab15c230e0ac0dbacff12d2626497dec0c')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL='--skipdeps'                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
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

  find "${pkgdir}" -name '.packlist' -o -name 'perllocal.pod' -delete
}
