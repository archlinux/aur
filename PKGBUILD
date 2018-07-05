# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

set -u
_perlmod='File-Touch'
_modnamespace='File'
pkgname="perl-${_perlmod,,}"
pkgver='0.11'
pkgrel='1'
pkgdesc="${_perlmod//-/::} update file access and modification times, optionally creating files if needed"
arch=('any')
#url='http://search.mcpan.org/dist/File-Touch'
url="http://search.cpan.org/dist/${_perlmod}"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.006')
options=('!emptydirs')
_srcdir="${_perlmod}-${pkgver}"
#source=("https://cpan.metacpan.org/authors/id/N/NE/NEILB/${_perlmod}-${pkgver}.tar.gz")
_verwatch=("http://www.cpan.org/modules/by-module/${_modnamespace}/" "${_perlmod}-\([0-9\.]*\)\.tar\.gz" 'l')
source=("${_verwatch[0]}${_perlmod}-${pkgver}.tar.gz")
md5sums=('caf4101a022f66c88f5fb4383b3f6388')
sha256sums=('e379a5ff89420cf39906e5ceff309b8ce958f99f9c3e57ad52b5002a3982d93c')
sha512sums=('7f1d46fe26de863388854e222b0229e29f0575ee0d8ed59f8cc447a39bc40d7fda425a394a4c3bbc9f561370b6c82cec9c65f4bb784ebba4ff72dbcb5c0a4cd0')

build() {
  set -u
  cd "${_srcdir}"
  PERL_MM_USE_DEFAULT='1' \
  PERL5LIB='' \
  PERL_AUTOINSTALL='--skipdeps' \
  PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'" \
  PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
  MODULEBUILDRC=/dev/null \
  perl 'Makefile.PL'
  make
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  #PERL_MM_USE_DEFAULT='1' \\
  #PERL5LIB='' \\
  make test
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make install

  find "${pkgdir}" -name '.packlist' -o -name 'perllocal.pod' -delete
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
