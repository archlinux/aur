# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: mmirate
# Contributor: pshevtsov
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

set -u
_perlmod='Text-Aligner'
_modnamespace="${_perlmod%%-*}"
pkgname="perl-${_perlmod,,}"
pkgver='0.16'
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
md5sums=('2306e6b557c434a33fe030cd6ee84142')
sha256sums=('5c857dbce586f57fa3d7c4ebd320023ab3b2963b2049428ae01bd3bc4f215725')
sha512sums=('ad3135de32ce870fbb9e5ccf9ad0d02f655c3e37397127009ad46e7baca515f9bb011251958c7fdbcc2ceabcfbbcb4dc8608c0b70ec3e4086492e1c6c1b38dfb')

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
