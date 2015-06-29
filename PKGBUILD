# Maintainer: Christian Hesse <mail@eworm.de>
# CPAN Name: Module-Starter

pkgname=perl-module-starter
pkgver=1.62
pkgrel=2
pkgdesc='a simple starter kit for any module'
arch=('any')
url='http://search.cpan.org/dist/Module-Starter'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-path-class')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/X/XS/XSAWYERX/Module-Starter-${pkgver}.tar.gz")
sha256sums=('ff08a7b9690f54709b7c0bc8bbb6df26209e4c7a7e6194f0697c5bbeb71ee5c3')

build() {
	cd "${srcdir}/Module-Starter-${pkgver}"

	export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "${srcdir}/Module-Starter-${pkgver}"

	make test
}


package() {
	cd "${srcdir}/Module-Starter-${pkgver}"

	make DESTDIR="${pkgdir}" install

	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

