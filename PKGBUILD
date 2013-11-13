# Maintainer: Techlive Zheng <techlivezheng [at] gmail [dot] com>
# Contributor: Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: David Zaragoza <david@zaragoza.com.ve>
# Contributor: Piotr Beling <qwak@w8.pl>
# Contributor: Wael Nasreddine <wael@phoenixlinux.org>
# Contributor: Guillermo A. Amaral <me@guillermoamaral.com> (thewonka)
# Contributor: Chih-mao Chen <pkmx.tw@gmail.com>

pkgname='perl-convert-uulib'
pkgver='1.4'
pkgrel='3'
pkgdesc='Perl interface to the uulib library (a.k.a. uudeview/uuenview).'
_dist=Convert-UUlib
arch=('any')
url='http://search.cpan.org/~mlehmann/Convert-UUlib/'
license=('GPL' 'PerlArtistic')
depends=('perl>=5.8.4')
options=(!emptydirs)
install="install"
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/Convert-UUlib-${pkgver}.tar.gz")
md5sums=('a6486df1d9ce319406fb9d5a610da759')

build(){
  cd "${srcdir}"/"${_dist}"-"${pkgver}"

  unset PERL5LIB PERL_MM_OPT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

  perl Makefile.PL
  make
}
package() {
  cd "${srcdir}"/"${_dist}"-"${pkgver}"

  unset PERL5LIB PERL_MM_OPT

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"

    # remove perllocal.pod and .packlist
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}
