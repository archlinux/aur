# CPAN Name  : Math::GSL
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-math-gsl
pkgver=0.44
pkgrel=1
pkgdesc='Perl module providing interface to the GNU Scientific Library'
arch=('i686' 'x86_64')
url='https://metacpan.org/release/Math-GSL'
license=(GPL-2.0-or-later)
options=(!emptydirs)
depends=('perl' 'gsl')
makedepends=('perl-module-build' 'perl-alien-gsl')
checkdepends=('perl-test-exception' 'perl-test-class' 'perl-test-most' 'perl-test-taint')
source=("https://cpan.metacpan.org/authors/id/H/HA/HAKONH/Math-GSL-$pkgver.tar.gz")
md5sums=('c3249e41b1c304a8fb45e6982543c408')

prepare() {
	cd Math-GSL-$pkgver
	sed -e "/'1\.16'/s/1\.16/2.7/g" -i inc/Ver2Func.pm
}
build() {
	cd Math-GSL-$pkgver
	PERL_MM_USE_DEFAULT=1 perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd Math-GSL-$pkgver
	perl Build test
}

package() {
	cd Math-GSL-$pkgver
	perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
