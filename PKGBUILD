# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Techlive Zheng <techlivezheng [at] gmail [dot] com>
# Contributor: Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: David Zaragoza <david@zaragoza.com.ve>
# Contributor: Piotr Beling <qwak@w8.pl>
# Contributor: Wael Nasreddine <wael@phoenixlinux.org>
# Contributor: Guillermo A. Amaral <me@guillermoamaral.com> (thewonka)
# Contributor: Chih-mao Chen <pkmx.tw@gmail.com>

pkgname='perl-convert-uulib'
pkgver='1.5'
pkgrel='1'
pkgdesc='Perl interface to the uulib library (a.k.a. uudeview/uuenview).'
_dist=Convert-UUlib
arch=('any')
url='http://search.cpan.org/~mlehmann/Convert-UUlib/'
license=('GPL' 'PerlArtistic')
depends=(perl perl-canary-stability)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/Convert-UUlib-${pkgver}.tar.gz")
sha512sums=('92c8b6f3a72546dca21018ddf2863113904f550e3ed950a1898ed4abfcc48738e9ca374f5adbc3226df2db6beeb0e12879ae52cdd067a030c199766d53603ec1')

build() {
  cd "${srcdir}"/"${_dist}"-"${pkgver}"

  unset PERL5LIB PERL_MM_OPT CPPFLAGS
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
