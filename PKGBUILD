# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-proc-find"
pkgver="0.051"
pkgrel='1'
pkgdesc="Find processes by name, PID, or some other attributes"
arch=(any)
license=('PerlArtistic')
url="Find processes by name, PID, or some other attributes"
depends=(
  'perl'
  'perl-proc-processtable'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PE/PERLANCAR/Proc-Find-${pkgver}.tar.gz")
sha512sums=('69c1363c9af7c3a441beed28233fdef315a4e20ae9bd209591c46ed46ef537833727ca5ebc9ab6001295939926ac6ba3820ba63c4ac34f438734b82e043bd647')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Proc-Find-${pkgver}"
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
