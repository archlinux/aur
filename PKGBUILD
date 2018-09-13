# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: mmirate
# Contributor: pshevtsov
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

set -u
_perlmod='Text-Aligner'
_modnamespace="${_perlmod%%-*}"
pkgname="perl-${_perlmod,,}"
pkgver='0.13'
pkgrel='1'
pkgdesc="Perl CPAN ${_perlmod//-/::} - Align text in columns"
arch=('any')
url="https://metacpan.org/release/${_perlmod}"
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
_verwatch=("http://www.cpan.org/modules/by-module/${_modnamespace}/" "${_perlmod}-\([0-9\.]*\)\.tar\.gz" 'l')
_srcdir="${_perlmod}-${pkgver}"
source=("${_verwatch[0]}${_perlmod}-${pkgver}.tar.gz")
md5sums=('a084016cb3fa9caa858f297d524cc3d7')
sha256sums=('e61c1c93cdefd9cc2a40f12fa8bfb12e64bb06d2375ba9e61534249865103eef')
sha512sums=('493ab6b32319e74c4b08b8473a17e69d5ce49d28495c7c759709661863a88613b766c3275035ea43f82448ea4f37a02ae2ab8f7baf68d79388b125dbd440004a')

build() {
  set -u
  cd "${_srcdir}"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl 'Makefile.PL' INSTALLDIRS='vendor'
  make
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  make test
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make install DESTDIR="${pkgdir}"
  find "${pkgdir}" '(' -name '.packlist' -o -name 'perllocal.pod' ')' -delete
  set +u
}
set +u

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
