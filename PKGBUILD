# CPAN Name  : Term::QRCode
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-term-qrcode
pkgver=0.01
pkgrel=2
pkgdesc='Term-QRCode for Perl'
arch=('any')
url="http://search.cpan.org/~yappo/Term-QRCode-${pkgver}/"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-text-qrcode')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/Y/YA/YAPPO/Term-QRCode-${pkgver}.tar.gz")
sha256sums=('058d97dec9927df242baa2e8db6c37345f9747f3095369fba00e3771153f1079')

build() {
	cd "${srcdir}/Term-QRCode-${pkgver}"

	export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1

	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "${srcdir}/Term-QRCode-${pkgver}"

	make test
}

package() {
	cd "${srcdir}/Term-QRCode-${pkgver}"

	make DESTDIR="${pkgdir}" install

	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

