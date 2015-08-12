# Maintainer: Techlive Zheng <techlivezheng [at] gmail [dot] com>
# Contributor: Arthur Titeica <arthur.titeica [at] gmail [dot] com>
# Contributor: Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
# Contributor: Wael Nasreddine <wael@phoenixlinux.org>
# Contributor: Guillermo A. Amaral <me@guillermoamaral.com> (thewonka)

pkgname='perl-convert-tnef'
pkgver='0.18'
pkgrel='3'
pkgdesc='Perl module to read TNEF files.'
_dist=Convert-TNEF
arch=('any')
url='http://search.cpan.org/~dougw/Convert-TNEF/'
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-io-stringy' 'perl-mime-tools')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/D/DO/DOUGW/Convert-TNEF-${pkgver}.tar.gz")
md5sums=('6f69ff242a807b861c6e68a3d93a58f7')

build() {
  cd "${srcdir}"/"${_dist}"-"${pkgver}"

  unset PERL5LIB PERL_MM_OPT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

  perl Makefile.PL
  make
}

check() {
  cd "${srcdir}"/"${_dist}"-"${pkgver}"

  unset PERL5LIB PERL_MM_OPT
  export PERL_MM_USE_DEFAULT=1

  make test
}

package() {
  cd "${srcdir}"/"${_dist}"-"${pkgver}"

  unset PERL5LIB PERL_MM_OPT

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"

  find "${pkgdir}" -name '.packlist' -o -name 'perllocal.pod' -delete
}
