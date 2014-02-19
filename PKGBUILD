# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Swift Geek <swiftgeek «at» gmail.com>
cpaname=ExtUtils-Typemap
pkgname=perl-${cpaname,,}
pkgver=1.00
pkgrel=1
pkgdesc="ExtUtils::Typemap "
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
depends=('perl')
source=("http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/${cpaname}-${pkgver}.tar.gz")
sha256sums=('b1b015772dbb068b93a0f6ffa02f5d94822365e6018ac5ed2bc53ca669071fc7')
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
	 PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'" \
	 PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
	 MODULEBUILDRC=/dev/null

build() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Build.PL
	 ./Build
}

check() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 ./Build test
}

package () {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 ./Build install

	 find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

