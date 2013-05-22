# Maintainer: Techlivezheng <techlivezheng [at] gmail [dot] com>
# Contributor: Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: David Zaragoza <david@zaragoza.com.ve>
# Contributor: Piotr Beling <qwak@w8.pl>
# Contributor: Wael Nasreddine <wael@phoenixlinux.org>
# Contributor: Guillermo A. Amaral <me@guillermoamaral.com> (thewonka)
# Contributor: Chih-mao Chen <pkmx.tw@gmail.com>

pkgname='perl-convert-uulib'
pkgver='1.4'
pkgrel='1'
pkgdesc='Perl interface to the uulib library (a.k.a. uudeview/uuenview).'
url='http://search.cpan.org/~mlehmann/Convert-UUlib/'
arch=('i686' 'x86_64')
license=('GPL' 'Artistic')
depends=('perl>=5.8.4')
options=(!emptydirs)
install="${pkgname}.install"
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/Convert-UUlib-${pkgver}.tar.gz")

build(){
    cd "${srcdir}/Convert-UUlib-${pkgver}"

    # install module in vendor directories.
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
    make || return 1
    make install DESTDIR=${pkgdir} || return 1

    # remove perllocal.pod and .packlist
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}

md5sums=('a6486df1d9ce319406fb9d5a610da759')
