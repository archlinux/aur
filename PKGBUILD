# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

set -u
_perlmod='File-Touch'
_modnamespace='File'
pkgname="perl-${_perlmod,,}"
pkgver='0.12'
pkgrel='1'
pkgdesc="${_perlmod//-/::} update file access and modification times, optionally creating files if needed"
arch=('any')
url="https://metacpan.org/release/${_perlmod}"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.006')
options=('!emptydirs')
_srcdir="${_perlmod}-${pkgver}"
#source=("https://cpan.metacpan.org/authors/id/N/NE/NEILB/${_perlmod}-${pkgver}.tar.gz")
_verwatch=("http://www.cpan.org/modules/by-module/${_modnamespace}/" "${_perlmod}-\([0-9\.]*\)\.tar\.gz" 'l')
source=("${_verwatch[0]}${_perlmod}-${pkgver}.tar.gz")
md5sums=('84215f5010adcbec0065e1c718d8875f')
sha256sums=('2a04dc424df48e98c54556c6045cab026a49e3737aa94a21cf497761b0f2e59c')
sha512sums=('0a13b4a2260fb134ba8ab2fc521aa9d92c9724773c06626e90bdb8b67c3ffab99679cb7f9ef6bfa5335c1d4fdf9bdbcfd8a8927f6fed5a0800dd3c9504904b40')

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
