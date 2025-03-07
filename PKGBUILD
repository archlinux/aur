# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-json-rpc
_realname='JSON-RPC'
pkgver=1.06
pkgrel=5
pkgdesc="Perl implementation of JSON-RPC 1.1 protocol"
arch=('any')
conflicts=('perl-json-rpc-legacy')
license=(
  'PerlArtistic'
  'GPL'
)
options=('!emptydirs')
depends=(
  'perl'
  'perl-libwww'
  'perl-plack'
  'perl-router-simple'
  'perl-json'
  'perl-cgi'
)
makedepends=('perl-module-build')
checkdepends=('perl-test-pod')
url='http://search.cpan.org/~dmaki/JSON-RPC'
source=("http://search.cpan.org/CPAN/authors/id/D/DM/DMAKI/JSON-RPC-${pkgver}.tar.gz")
sha256sums=('d75ba8b558988b3fdffa12ff62a55f0f1aaff8aa73b708bff3701ff88a2b8757')
_distdir="JSON-RPC-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_distdir}"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "${srcdir}/${_distdir}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "${srcdir}/${_distdir}"
  /usr/bin/perl Build install

  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}
